import 'package:flutter/material.dart';
import 'package:learning/src/ui/apptheme.dart';
import 'package:learning/src/ui/bottom_navigation.dart';
import 'package:learning/src/ui/my_cards.dart';
import 'package:learning/util_variables.dart';

double sizedBoxWidth = 140.o;
double sizedBoxHeight = 140.o;
String profileName = 'Eshonov Fakhriyor';
String itemName = 'Отправители';

double profileIconSize = 75.o;
Icon itemIcon = const Icon(Icons.confirmation_num_sharp);

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
                    _buildProfileAvatar(),
                    _buildProfileTitle(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.o)),
                    color: theme.card),
                child: Column(
                  children: [
                    _buildContainerLabel('БЛАГОТВОРИТЕЛНОСТЬ'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyCards()), // Navigate to ScreenB
                        );
                      },
                      child: _buildColumnItem(itemIcon, 'Мои карты'),
                    ),
                    _divideItem(),
                    _buildColumnItem(itemIcon, itemName),
                    _divideItem(),
                    _buildColumnItem(itemIcon, itemName),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.o)),
                    color: theme.card),
                child: Column(
                  children: [
                    _buildContainerLabel('ДРУГИЕ'),
                    _buildColumnItem(itemIcon, itemName),
                    _divideItem(),
                    _buildColumnItem(itemIcon, itemName),
                    _divideItem(),
                    _buildColumnItem(itemIcon, itemName),
                    _divideItem(),
                    _buildColumnItem(itemIcon, itemName),
                    _divideItem(),
                    _buildColumnItem(itemIcon, itemName),
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
                color: theme.primary,
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
        bottomNavigationBar: const HomeBottomNavBar());
  }

  Widget _buildProfileAvatar() {
    return Padding(
      padding: EdgeInsets.only(top: 8.o),
      child: SizedBox(
        width: sizedBoxWidth,
        height: sizedBoxHeight,
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
                  border: Border.all(width: 2.o, color: Colors.yellow)),
              child: Icon(
                Icons.person,
                size: profileIconSize,
                color: theme.primary,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                    color: theme.primary,
                    borderRadius: BorderRadius.circular(10.o)),
                child: SizedBox(
                  height: 30.o,
                  width: 30.o,
                  child: IconButton(
                    padding: EdgeInsets.all(0.o),
                    color: theme.yellow,
                    icon: Icon(
                      Icons.add,
                      size: 18.o,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTitle() {
    return Padding(
      padding: EdgeInsets.all(5.o),
      child: Text(
        profileName,
        style: TextStyle(fontSize: 22.o, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildColumnItem(Icon itemIcon, String itemTitle) {
    return Container(
      padding: EdgeInsets.all(4.o),
      margin: EdgeInsets.symmetric(horizontal: 20.o),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          /*const Icon(Icons.confirmation_num_sharp)*/ itemIcon,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.o),
            child: Text(
              itemTitle,
              style: theme.textStyle,
            ),
          ),
          const Spacer(),
          const Icon(Icons.navigate_next_rounded),
        ],
      ),
    );
  }

  Widget _divideItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.o),
      child: const Divider(),
    );
  }

  Widget _buildContainerLabel(String containerTitle) {
    return Container(
      padding: EdgeInsets.only(top: 16.o, left: 10.o, bottom: 8.o),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 15.o),
      child: Text(
        containerTitle,
        style: TextStyle(
          fontSize: 16.o,
          color: const Color.fromARGB(255, 122, 129, 133),
        ),
      ),
    );
  }
}
