import 'package:flutter/material.dart';

class PostMoviesTextField extends StatelessWidget {
  final String labletext;
  final Icon icon;
  final RegExp regExp;
  final TextEditingController controller;
  const PostMoviesTextField(
      {Key? key,
      required this.labletext,
      required this.icon,
      required this.controller,
      required this.regExp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //? validating user input
      validator: (value) {
        if (value!.isEmpty || !regExp.hasMatch(value)) {
          return "Enter Something!";
        } else {
          return null;
        }
      },
      controller: controller,
      maxLines: 1,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: icon,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        labelText: labletext,
        fillColor: Colors.white,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 143, 143, 143)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 143, 143, 143)),
        ),
        labelStyle: const TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
      ),
    );
  }
}
