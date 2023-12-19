import 'package:flutter/material.dart';
import 'package:myapp/item/ItemSpendingContent.dart';

class InputContent extends StatelessWidget {
  const InputContent({super.key, required this.getInput});
  final Function getInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        backgroundColor: const Color(0xFFd9342e),
      ),
      body: TextFieldAddTransaction(getInput: getInput),
    );
  }
}

class TextFieldAddTransaction extends StatelessWidget {
  TextFieldAddTransaction({
    super.key,
    required this.getInput,
  });
  final Function getInput;
  final TextEditingController _inputControllerName = TextEditingController();
  final TextEditingController _inputControllerMoney = TextEditingController();

  void clickOnButton() {
    var name = _inputControllerName.text;
    var money = _inputControllerMoney.text;
    getInput(name, money);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      child: Column(
        children: [
          TextFieldInput(inputController: _inputControllerMoney),
          TextFieldInputName(
            inputController: _inputControllerName,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              onPressed: () {
                clickOnButton();
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required TextEditingController inputController,
  }) : _inputController = inputController;

  final TextEditingController _inputController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _inputController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Enter The Money',
        suffixText: ' VND', // văn bản xuất hiện sau khi nhập
        suffixStyle: TextStyle(
            color: Color.fromARGB(255, 77, 179, 69),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromARGB(255, 77, 179, 69),
              width: 3), // Màu khi được chọn
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black, width: 3), // Màu khi không được chọn
        ),
      ),
    );
  }
}

class TextFieldInputName extends StatelessWidget {
  const TextFieldInputName({
    super.key,
    required TextEditingController inputController,
  }) : _inputController = inputController;

  final TextEditingController _inputController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _inputController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Enter Content',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromARGB(255, 77, 179, 69),
              width: 3), // Màu khi được chọn
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black, width: 3), // Màu khi không được chọn
        ),
      ),
    );
  }
}


// go back
// ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),