import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/src/ui/adding_cards.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/src/ui/empty_card_screen.dart';
import 'package:learning/src/ui/exist_card_screen.dart';
import 'package:learning/src/ui/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_card_button.dart';
import 'card_details.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  List<CardDetails> cards = [];

  @override
  void initState() {
    retrieveCards();
    super.initState();
  }

  Future<void> saveCards(List<CardDetails> cards) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cardMapList =
        cards.map((card) => card.toJSON()).toList();

    final String cardListJSON = json.encode(cardMapList);
    await prefs.setString('cardList', cardListJSON);
  }

  void addCard() async {
    await saveCards(cards);
  }

  Future<void> retrieveCards() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cardListJson = prefs.getString('cardList');

    if (cardListJson != null) {
      final List<dynamic> cardMapList = json.decode(cardListJson);

      setState(() {
        cards = cardMapList.map((cardMap) {
          return CardDetails.fromJSON(cardMap as Map<String, dynamic>);
        }).toList();
      }); // Update the UI to reflect changes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.appbar,
      body: Column(
        children: [
          const BackAppbar(
            title: 'Мои карты',
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  cards.isNotEmpty
                      ? ExistCardScreen((int indexCards) {
                          setState(() {
                            cards.removeAt(indexCards);
                            addCard();
                          });
                        }, cards)
                      : const EmptyCardScreen(),
                  AddCardButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddingCard(
                            cards,
                            onUpdate: () {
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
