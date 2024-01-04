import 'package:flutter/material.dart';
import 'package:learning/util_variables.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
   _HomeBottomNavBarState createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
   int selectedIndex = 0; // Variable to track the selected index

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        height: 60.0, // Height of the bottom navigation bar
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(8.o),
            topRight: Radius.circular(8.o),
          ),
          color: Colors.white, // Background color of the "card"
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1.o), // Shadow color
              spreadRadius: 2.o,
              blurRadius: 4,
              offset:  Offset(0.o, -2.o), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(Icons.home, 'Главная', 0),
            // Pass index to each navigation item
            buildNavItem(Icons.clean_hands, 'Благотварительность', 1),
            buildNavItem(Icons.person, 'Профиль', 2),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update the selected index on tap
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4.0.o,
            width: 50.0.o,
            decoration: BoxDecoration(
              color:
                  selectedIndex == index ? Colors.yellow : Colors.transparent,
              borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(5.o),
                bottomRight: Radius.circular(5.o),
              ),
            ),
          ),
           SizedBox(height: 8.0.o),
          Icon(
            icon,
            color: selectedIndex == index ? Colors.yellow : Colors.grey,
          ),
           SizedBox(height: 4.0.o),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0.o,
              color: selectedIndex == index ? Colors.yellow : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
