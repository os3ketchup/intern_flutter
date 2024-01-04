import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/util_variables.dart';

import 'apptheme.dart';

class CardNumberTextField extends StatelessWidget {
  const CardNumberTextField(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.o),
      child: TextField(
        controller: controller,
        inputFormatters: [theme.numberMaskFormatter],
        style: theme.textStyle
            .copyWith(fontSize: 18.o, fontWeight: FontWeight.w500),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.o),
              ),
            ),
            hintStyle: TextStyle(fontSize: 18.o),
            hintText: 'XXXX XXXX XXXX XXXX'),
      ),
    );
  }
}
