import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/src/ui/my_cards.dart';
import 'package:learning/util_variables.dart';
import 'package:pinput/pinput.dart';

import 'custom_dialog.dart';


class Confirmation extends StatelessWidget {
  const Confirmation(this.navigatorPop, {super.key});

  final void Function() navigatorPop;

  @override
  Widget build(BuildContext context) {
    void _showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog();
        },
      );
    }
    return Scaffold(
      body: Center(
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
                      child: const Text(
                        'На номер +77 985 32 84 был отправлен '
                        '4 значный смс код введите его!',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text('Введите код', textAlign: TextAlign.center),
                  ),
                  PinputExample(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.o),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(14.o),
                ),
                color: Colors.yellow,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  navigatorPop();
                  _showCustomDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.o),
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: Text(
                        'Подтвердить',
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
            )
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          padding: EdgeInsets.only(bottom: 8.o, top: 32.o),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.o),
                  bottomLeft: Radius.circular(10.o))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.all(Radius.circular(8.o))),
                margin: EdgeInsets.all(8.o),
                child: SizedBox(
                  height: 30.o,
                  width: 30.o,
                  child: IconButton(
                    padding: EdgeInsets.all(0.o),
                    onPressed: () {
                      //don't code here

                    },
                    icon: const Icon(Icons.arrow_back_outlined),
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 40.o),
                  child: Center(
                    child: Text(
                      'Подтверждение',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.o),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class PinputExample extends StatefulWidget {
  const PinputExample({super.key});

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  int _counter = 60; // Initial counter value in seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // // },
              // hapticFeedbackType: HapticFeedbackType.lightImpact,
              // onCompleted: (pin) {
              //   debugPrint('onCompleted: $pin');
              // },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19.o),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
              startTimer();
            },
            child:
                _counter > 0 ? Text(getFormattedTime()) : Text('Отправте еще'),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel(); // Stop the timer when countdown reaches 0
        }
      });
    });
  }

  String getFormattedTime() {
    int minutes = _counter ~/ 60;
    int seconds = _counter % 60;
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$minutesStr:$secondsStr';
  }
}
