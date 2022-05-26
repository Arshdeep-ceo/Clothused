import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class FireBaseDataBase extends GetxController {
  Future<String> createImageHash(String url) async {
    final response = await http.get(Uri.parse(url));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File(join(documentDirectory.path, 'imagetest.png'));
    file.writeAsBytesSync(response.bodyBytes);

    final data = file.readAsBytesSync();
    final image = img.decodeImage(data.toList());
    final blurHash = BlurHash.encode(image!, numCompX: 7, numCompY: 7);
    print(blurHash.hash);
    return blurHash.hash;
  }
}
