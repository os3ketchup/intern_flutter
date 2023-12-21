import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/src/ui/card_details.dart';
import 'package:learning/src/ui/my_cards.dart';
import 'package:learning/util_variables.dart';

import 'custom_dialog.dart';

class ExistCardScreen extends StatelessWidget {
  const ExistCardScreen(this.onUpdate,this.cards, {super.key});

  final List<CardDetails> cards;
  final Function(int indexes) onUpdate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          CardDetails currentItem = cards[index];
          return Container(
            color: theme.card,
            margin: EdgeInsets.all(10.o),
         
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.o)),
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.deepPurple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft)),
                  height: 35.o,
                  width: 45.o,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8.o),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Visa',
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          currentItem.number.isNotEmpty &&
                                  currentItem.number.length > 6
                              ? "**** **** **** ${currentItem.number.substring(currentItem.number.length - 4, currentItem.number.length)}"
                              : currentItem.number,
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  padding: EdgeInsets.all(0.o),
                  offset: const Offset(-35,25),
                  color: Colors.white,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      padding: EdgeInsets.all(5.o),
                      value: 'option1',
                      onTap: () {
                          onUpdate(index);
                        print('$index clicked !!!');
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          Text(
                            'Удалить',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
          //   ListTile(
          //   title: Text(currentItem.number),
          //   subtitle: Text(
          //       'Age: ${currentItem.age}, Location: ${currentItem.cvc}'),
          //   // You can customize the ListTile according to your requirements
          //   // For example, you can add leading, trailing icons, etc.
          // );
        },
      ),
    );
  }
}
