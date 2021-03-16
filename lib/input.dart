import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.etDecimal,
  }) : super(key: key);

  final TextEditingController etDecimal;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: etDecimal,
      decoration: const InputDecoration(
        hintText: "Masukkan Bilangan",
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
