import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({required Key key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.start ,
        hintText: 'Username',
      ),
    );
  }
}
