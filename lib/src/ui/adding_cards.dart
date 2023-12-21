import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/src/ui/card_details.dart';
import 'package:learning/src/ui/confirming.dart';
import 'package:learning/util_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddingCard extends StatefulWidget {
  final Function onUpdate;
   const AddingCard(this.cardList,{super.key, required this.onUpdate});
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
        cards.map((card) => card.toJson()).toList();

    final String cardListJson = json.encode(cardMapList);
    await prefs.setString('cardList', cardListJson);
  }

  void addCard() {
    final String cardNumber = cardNumberController.text;
    final String expiryDate = expiryDateController.text;
    final String cvc = cvcController.text;
    final newCard = CardDetails(cardNumber, expiryDate, cvc);

    print('${widget.cardList.length}');
    setState(() {
      widget.cardList.add(newCard);
      saveCards(widget.cardList); // Save the updated card list

    }); // Update the UI to reflect changes


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
                      'Добавление новой карты',
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                  child: const Text(
                    'Номер карты',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromARGB(102, 39, 39, 37)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.o),
                  child: TextField(
                    controller: cardNumberController,
                    inputFormatters: [theme.numberMaskFormatter],
                    style: theme.textStyle
                        .copyWith(fontSize: 18.o, fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.o),
                          ),
                        ),
                        hintStyle: TextStyle(fontSize: 18.o),
                        hintText: 'XXXX XXXX XXXX XXXX'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.o),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(8.o),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Годен до',
                                style: TextStyle(
                                    color: Color.fromARGB(102, 39, 39, 37)),
                              ),
                              TextField(
                                controller: expiryDateController,
                                inputFormatters: [theme.yearMaskFormatter],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.o),
                                      ),
                                    ),
                                    hintStyle: TextStyle(fontSize: 18.o),
                                    hintText: 'DD/MM'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(8.o),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'CVC',
                                style: TextStyle(
                                    color: Color.fromARGB(102, 39, 39, 37)),
                              ),
                              TextField(
                                controller: cvcController,
                                inputFormatters: [theme.cvcMaskFormatter],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.o),
                                      ),
                                    ),
                                    hintStyle: TextStyle(fontSize: 18.o),
                                    hintText: 'XXX'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                print('clicked');
                widget.onUpdate();
                addCard();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Confirmation((){

                          Navigator.pop(context);
                          print('second SCCCREEN POP');

                        })));
                // Navigator.pop(context);
              },
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
          )
        ],
      ),
    );
  }
}
