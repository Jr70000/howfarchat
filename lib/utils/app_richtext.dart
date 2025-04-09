import 'package:flutter/material.dart';
import 'package:howfarchat/constant/app_text.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: AppText.forgotpassword,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFFC2C2C2)
          )),
          // TextSpan(
          //   text: '',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontStyle: FontStyle.italic,
          //     color: Colors.blue,
          //   ),
          // ),
          // TextSpan(text: ' example.'),
        ],
      ),
    );
  }
}
