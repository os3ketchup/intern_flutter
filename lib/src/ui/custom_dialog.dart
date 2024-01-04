import 'package:flutter/material.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/util_variables.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.credit_score,
              color: theme.primary,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Карта успешно \n добавлена!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: 200.o,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.o)),color: theme.yellow),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Закрыть',style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
