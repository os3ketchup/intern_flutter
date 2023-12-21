import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/src/ui/adding_cards.dart';
import 'package:learning/src/ui/empty_card_screen.dart';
import 'package:learning/src/ui/exist_card_screen.dart';
import 'package:learning/util_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'card_details.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  // List to hold multiple cards
  List<CardDetails> cards = [];

  @override
  void initState() {
    retrieveCards();
    super.initState();
    // Retrieve existing cards when the screen initializes
  }



  Future<void> saveCards(List<CardDetails> cards) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cardMapList =
    cards.map((card) => card.toJson()).toList();

    final String cardListJson = json.encode(cardMapList);
    await prefs.setString('cardList', cardListJson);
  }

  void addCard() {
    setState(() {
      saveCards(cards); // Save the updated card list
    }); // Update the UI to reflect changes
  }



  Future<void> retrieveCards() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cardListJson = prefs.getString('cardList');
    /*prefs.getStringList('cardList');*/

    if (cardListJson != null) {
      final List<dynamic> cardMapList = json.decode(cardListJson);

      setState(() {
        cards = cardMapList.map((cardMap) {
          return CardDetails.fromJson(cardMap as Map<String, dynamic>);
        }).toList();
      }); // Update the UI to reflect changes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Navigator.pop(context);
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
                      'Мои карты',
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
      body: Center(
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.o),
            decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.all(Radius.circular(14.o))),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddingCard(
                                cards,
                                onUpdate: () {
                                  setState(() {});
                                },
                              )));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add_card_sharp,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Добавить новую карту',
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
