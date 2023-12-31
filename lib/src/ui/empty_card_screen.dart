import 'package:flutter/material.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/util_variables.dart';

class EmptyCardScreen extends StatefulWidget {
  const EmptyCardScreen({super.key});

  @override
  State<EmptyCardScreen> createState() => _EmptyCardScreenState();
}

class _EmptyCardScreenState extends State<EmptyCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Icon(Icons.add_card),
      SizedBox(
        height: 20.o,
      ),
      SizedBox(
        width: 150.o,
        child:  Text(
          'У вас нету добавленных карт',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 20.o,
      ),
      SizedBox(
        width: 200.o,
        child:  Text(
          'Пожалуста добавьте карту для пожертвование',
        textAlign: TextAlign.justify,
          style: theme.textStyle,
        ),
      ),
      SizedBox(
        height: 20.o,
      ),
    ],);
  }
}
