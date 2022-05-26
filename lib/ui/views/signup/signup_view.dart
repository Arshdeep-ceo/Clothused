import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:stacked_architecture/constants/theme.dart';
import 'package:stacked_architecture/services/firebase_database.dart';
import 'package:stacked_architecture/ui/views/signup/signup_viewmodel.dart';
import '../../../widgets/textfield_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupViewModel signupViewModel = Get.put(SignupViewModel());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FireBaseDataBase fireBaseDataBase = Get.put(FireBaseDataBase());
    String email = '';
    String password = '';
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          SizedBox.expand(
            child: BlurHash(
              hash:
                  'yIKm;4Ri_NROIUM{aJ~Wjrxut6M{xufPE1ofIAR+R*ogozM{ofocRPt7WBozxus:M{ayoft6j[oLM|j?ozW=jYRPRjj[V@t7xuV@V@',
              image:
                  'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhc2hpb258ZW58MHwxfDB8fA%3D%3D&auto=format&fit=crop&w=500',
              imageFit: BoxFit.cover,
              errorBuilder: (context, object, n) {
                return const Center(
                  child: Text('NO INTERNET'),
                );
              },
            ),
          ),
          Center(
              child: BlurryContainer(
            // color: Colors.white,
            elevation: 1,
            blur: 1.5,
            height: Get.size.height * 0.45,
            width: Get.size.width * 0.95,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('SIGNUP',
                      style: Get.textTheme.headline6!
                          .copyWith(color: Colors.white)),
                ),
                TextFieldWidget(
                  hintText: 'Email',
                  controller: emailController,
                  onChanged: (text) => email = text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  hintText: 'Password',
                  controller: passwordController,
                  onChanged: (text) => password = text,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (emailController.text.trim() != '' &&
                          passwordController.text.trim() != '') {
                        await signupViewModel.createNewUser(
                            email: email, password: password);
                      }
                      // fireBaseDataBase.createImageHash(
                      //     'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhc2hpb258ZW58MHwxfDB8fA%3D%3D&auto=format&fit=crop&w=500');
                    },
                    child: const Text(
                      'SIGNUP',
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      signupViewModel.navigateToLoginScreen();
                    },
                    child: const Text('Already a user? Log In')),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
