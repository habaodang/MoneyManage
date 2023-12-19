import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required TextEditingController inputController,
    required this.hint_text,
    required this.suffix_text,
  }) : _inputController = inputController;

  final TextEditingController _inputController;
  final hint_text;
  final suffix_text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _inputController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint_text,
        suffixText: suffix_text, // văn bản xuất hiện sau khi nhập
        suffixStyle: const TextStyle(
            color: Color.fromARGB(255, 77, 179, 69),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromARGB(255, 77, 179, 69),
              width: 3), // Màu khi được chọn
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black, width: 3), // Màu khi không được chọn
        ),
      ),
    );
  }
}
