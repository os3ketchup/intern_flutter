
import 'package:flutter/material.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/src/ui/continue_button.dart';
import 'package:learning/src/ui/pinput.dart';
import 'package:learning/src/ui/widgets.dart';
import 'package:learning/util_variables.dart';

import 'custom_dialog.dart';

const String enterCode = "Введите код";
const String titleAppbar = "Подтверждение";


class Confirmation extends StatelessWidget {
  const Confirmation(this.navigatorPop, {super.key});

  final void Function() navigatorPop;

  @override
  Widget build(BuildContext context) {
    void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialog();
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          const BackAppbar(
            title: titleAppbar,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8.o),
                          child: Transform.rotate(
                            angle: 315 * 3.14 / 180,
                            child: const Icon(
                              Icons.local_post_office_outlined,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8.o),
                            child: RichText(
                              text:  TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'На номер ',
                                    style: theme.textStyle,
                                  ),
                                  const TextSpan(
                                    text: '+77 985 32 84',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' был отправлен \n4 значный смс код введите его!',
                                    style: theme.textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(14.o),
                          child: Text(
                            enterCode,
                            textAlign: TextAlign.center,
                            style: theme.textStyle,
                          ),
                        ),
                        const CreditCardPinPut(),
                      ],
                    ),
                  ),
                  ContinueButton(onTap: () {
                    Navigator.pop(context);
                    navigatorPop();
                    showCustomDialog(context);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      appBar: theme.appbar,
    );
  }
}
