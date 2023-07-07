import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.inputController,
      required this.fieldName,
      this.autofocus});
  final TextEditingController inputController;
  final String fieldName;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: inputController,
        autofocus: autofocus! ? true : false,
        decoration: InputDecoration(
            labelText: fieldName,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            filled: true),
        validator: (val) {
          if (val!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(val!)) {
            return "enter incorrect";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
