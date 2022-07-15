import 'package:flutter/material.dart';
import '../constants/theme.dart';
import '../ui/views/login/login_viewmodel.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.text,
    this.borderRadius = 15,
    this.backgroundColor = Colors.black,
  }) : super(key: key);
  final double borderRadius;
  final double width;
  final double height;
  final String text;
  final Color backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: backgroundColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white),
        ),
      ),
    );
  }
}
