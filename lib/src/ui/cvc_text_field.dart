import 'package:flutter/material.dart';
import 'package:learning/util_variables.dart';

import 'apptheme.dart';

class CVCTextField extends StatelessWidget {
  const CVCTextField(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(8.o),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CVC',
              style: TextStyle(color: Color.fromARGB(102, 39, 39, 37)),
            ),
            TextField(
              controller: controller,
              inputFormatters: [theme.cvcMaskFormatter],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primary),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.o),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: 18.o),
                  hintText: 'XXX'),
            ),
          ],
        ),
      ),
    );
  }
}
