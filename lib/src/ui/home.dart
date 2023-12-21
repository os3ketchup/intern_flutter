import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/src/ui/bottom_navigation.dart';
import 'package:learning/src/ui/my_cards.dart';
import 'package:learning/util_variables.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.o),
                      child: SizedBox(
                        width: 140.o,
                        height: 140.o,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.o),
                              height: 140.o,
                              width: 140.o,
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.o,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.o, color: Colors.yellow)),
                              child: Icon(
                                Icons.person,
                                size: 75.o,
                                color: Colors.deepPurple,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius:
                                          BorderRadius.circular(10.o)),
                                  child: SizedBox(
                                      height: 30.o,
                                      width: 30.o,
                                      child: IconButton(
                                        padding: EdgeInsets.all(0.o),
                                        color: Colors.deepPurple,
                                        icon: Icon(
                                          Icons.add,
                                          size: 18.o,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.o),
                      child: Text(
                        'Eshonov Fakhriyor',
                        style: TextStyle(
                            fontSize: 22.o, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.o)),
                    color: theme.card),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(top: 16.o, left: 10.o, bottom: 8.o),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 15.o),
                      child: Text(
                        'Благодатворительность',
                        style: TextStyle(
                          fontSize: 16.o,
                          color: const Color.fromARGB(255, 122, 129, 133),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyCards()), // Navigate to ScreenB
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.o),
                        margin: EdgeInsets.symmetric(horizontal: 20.o),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(Icons.confirmation_num_sharp),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.o),
                              child: Text(
                                'Мои карты',
                                style: TextStyle(
                                  fontSize: 16.o,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.navigate_next_rounded),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: const Divider(),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.o),
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.confirmation_num_sharp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.o),
                            child: Text(
                              'Отправители ',
                              style: TextStyle(fontSize: 16.o),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: const Divider(),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.o),
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.confirmation_num_sharp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.o),
                            child: Text(
                              'Автоплатежи',
                              style: TextStyle(fontSize: 16.o),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.o)),
                    color: theme.card),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 10.o, bottom: 8.o, top: 8.o),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 15.o),
                      child: Text(
                        'Другие',
                        style: TextStyle(
                          fontSize: 16.o,
                          color: const Color.fromARGB(255, 122, 129, 133),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.o),
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.confirmation_num_sharp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.o),
                            child: Text(
                              'О нас',
                              style: TextStyle(fontSize: 16.o),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: const Divider(),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.o),
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.confirmation_num_sharp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.o),
                            child: Text(
                              'Оцените приложение',
                              style: TextStyle(fontSize: 16.o),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: const Divider(),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.o),
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.confirmation_num_sharp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.o),
                            child: Text(
                              'Часто задаваемые вопросы',
                              style: TextStyle(fontSize: 16.o),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: const Divider(),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.o),
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.confirmation_num_sharp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.o),
                            child: Text(
                              'Язык приложение',
                              style: TextStyle(fontSize: 16.o),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: const Divider(),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.o),
                      margin: EdgeInsets.symmetric(horizontal: 20.o),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.confirmation_num_sharp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.o),
                            child: Text(
                              'Напишите нам',
                              style: TextStyle(fontSize: 16.o),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            padding: EdgeInsets.only(bottom: 8.o, top: 24),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.o),
                    bottomLeft: Radius.circular(10.o))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.o),
                  child: Text(
                    'Профиль',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.o,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarExample()

/*      PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          height: 60.o,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1.o), // Shadow color
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0.o, -2.o), // Shadow position
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 16.o),
                      height: 4.o,
                      width: 50.o,
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)))),
                  const Icon(
                    Icons.home,
                  ),
                  const Text(
                    'Главная',
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 4.o,
                      width: 50.o,
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)))),
                  const Icon(
                    Icons.clean_hands,
                  ),
                  const Text(
                    'Главная',
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 4.o,
                      width: 50.o,
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)))),
                  const Icon(
                    Icons.person,
                  ),
                  const Text(
                    'Главная',
                  )
                ],
              ),
            ],
          ),
        ),
      ),*/
        );
  }
}
// BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
//           BottomNavigationBarItem(icon: Icon(Icons.clean_hands), label: 'Бдагодатворительность'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
//         ],
//       ),
