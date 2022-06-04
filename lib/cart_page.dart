import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_page/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> number = [1, 1, 1];
  List<int> price = [30, 40, 50];
  List<int> yazilacak = [30, 40, 50];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: List.generate(cartList.length, (index) {
              /* var price = int.parse(cartList[index]["price"]); */

              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(cartList[index]["img"]),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartList[index]["name"],
                              style: const TextStyle(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ref" + cartList[index]["ref"],
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // return object of type Dialog
                                      return AlertDialog(
                                        title: const Text("Alert Dialog title"),
                                        content: const Text("xcmds"),
                                        actions: <Widget>[
                                          // usually buttons at the bottom of the dialog
                                          FlatButton(
                                            child: const Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                              },
                              child: Text(
                                cartList[index]["size"],
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  yazilacak[index].toString(),
                                  style: const TextStyle(fontSize: 22),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          currentIndex = index;
                                          if (number[currentIndex] > 1) {
                                            number[currentIndex]--;
                                            yazilacak[currentIndex] =
                                                price[currentIndex] *
                                                    number[currentIndex];
                                          }
                                         /* if (number[currentIndex] == 0) {
                                            yazilacak[currentIndex] =
                                                price[currentIndex];
                                          } */
                                        });
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.minus,
                                            size: 10,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      number[index].toString(),
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          currentIndex = index;
                                          number[currentIndex]++;
                                          yazilacak[currentIndex] =
                                              price[currentIndex] *
                                                  number[currentIndex];
                                        });
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.plus,
                                            size: 10,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.withOpacity(0.8),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Do you have a promotion code?",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey.withOpacity(0.8),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Delivery",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "Standard - Free",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50 / 2),
              ),
              child: Center(
                child: Text(
                  "Buy for \$50".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
