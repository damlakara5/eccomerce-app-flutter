import 'package:flutter/material.dart';
import 'package:login_page/Screens/FirstPage/first_page.dart';
/* import 'package:login_page/Screens/LOGIN/another_login.dart'; */
import 'package:login_page/Screens/store_page.dart';
import 'package:login_page/account_page.dart';
import 'package:login_page/cart_page.dart';
import 'package:login_page/constants.dart';
import 'package:login_page/more_page.dart';

class RootAppState extends StatefulWidget {
  const RootAppState({Key? key}) : super(key: key);

  @override
  State<RootAppState> createState() => _RootAppStateState();
}

class _RootAppStateState extends State<RootAppState> {
  int activeTab = 0;
  AppBar? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getFooter(),
    /*   appBar: AppBar(
          elevation: 0.8,
          backgroundColor: Colors.white,
          title: const Text("ACCOUNT", style: TextStyle(color: Colors.black)),
      ), */
      body: IndexedStack(
        index: activeTab,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const FirstPage(),
          const StorePage(),
          const AccountPage(),
          const CartPage(),
          const MorePage(),  
        ],
      ),
    );
  }


  Container getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(itemsTab.length, (index) {
              return IconButton(
                icon: Icon(
                  itemsTab[index]["icon"],
                  size: itemsTab[index]["size"],
                  color: activeTab == index ? kPrimaryColor : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
              );
            })),
      ),
    );
  }
}
