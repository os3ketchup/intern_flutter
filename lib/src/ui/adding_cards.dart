import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/src/ui/card_number_text_field.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/src/ui/card_details.dart';
import 'package:learning/src/ui/confirming.dart';
import 'package:learning/src/ui/continue_button.dart';
import 'package:learning/src/ui/cvc_text_field.dart';
import 'package:learning/src/ui/expiry_date_text_field.dart';
import 'package:learning/src/ui/widgets.dart';
import 'package:learning/util_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

String numberOfCard = 'Номер карты';

class AddingCard extends StatefulWidget {
  final Function onUpdate;

  const AddingCard(this.cardList, {super.key, required this.onUpdate});

  final List<CardDetails> cardList;

  @override
  State<AddingCard> createState() => _AddingCardState();
}

class _AddingCardState extends State<AddingCard> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvcController.dispose();
    super.dispose();
  }

  Future<void> saveCards(List<CardDetails> cards) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cardMapList =
        cards.map((card) => card.toJSON()).toList();

    final String cardListJson = json.encode(cardMapList);
    await prefs.setString('cardList', cardListJson);
  }

  void addCard() {
    final String cardNumber = cardNumberController.text;
    final String expiryDate = expiryDateController.text;
    final String cvc = cvcController.text;
    final newCard = CardDetails(cardNumber, expiryDate, cvc);

    setState(() {
      widget.cardList.add(newCard);
      saveCards(widget.cardList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.appbar,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const BackAppbar(
            title: 'Добавление новой карты',
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(14.o),
                  height: 200.o,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.o),
                    ),
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 14.o),
                  width: double.infinity,
                  child: Text(
                    numberOfCard,
                    textAlign: TextAlign.start,
                    style: theme.textStyle,
                  ),
                ),
                CardNumberTextField(cardNumberController),
                Container(
                  margin: EdgeInsets.all(10.o),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ExpiryDateTextField(expiryDateController),
                      CVCTextField(cvcController),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ContinueButton(onTap: () {
            widget.onUpdate();
            addCard();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Confirmation(
                  () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
            // Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
