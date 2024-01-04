import 'package:flutter/material.dart';
import 'package:learning/util_variables.dart';

import 'apptheme.dart';

const String enterNewCard = 'Добавить новую карту';

class AddCardButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddCardButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.o),
      decoration: BoxDecoration(
        color: theme.yellow,
        borderRadius: BorderRadius.all(Radius.circular(14.o)),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.o),
              child: const Icon(
                Icons.add_card_sharp,
                color: Colors.black87,
              ),
            ),
            Text(
              enterNewCard,
              style: theme.textStyle,
            )
          ],
        ),
      ),
    );
  }
}
