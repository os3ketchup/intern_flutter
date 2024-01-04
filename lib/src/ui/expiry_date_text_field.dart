import 'package:flutter/material.dart';
import 'package:learning/util_variables.dart';

import 'apptheme.dart';

class ExpiryDateTextField extends StatelessWidget {
  const ExpiryDateTextField(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(8.o),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Годен до',
              style: TextStyle(color: Color.fromARGB(102, 39, 39, 37)),
            ), //sssss
            TextField(
              controller: controller,
              inputFormatters: [theme.yearMaskFormatter],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.o),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: 18.o),
                  hintText: 'DD/MM'),
            )
          ],
        ),
      ),
    );
  }
}
