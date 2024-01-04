import 'package:flutter/material.dart';
import 'package:learning/util_variables.dart';

import 'apptheme.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onTap;

  const ContinueButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.o),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14.o),
        ),
        color: theme.yellow,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.all(8.o),
          child: const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Text(
                'Продолжить',
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
              )),
              Icon(
                Icons.navigate_next,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
