import 'dart:ui';

import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String? imagePath;
  final String? price;
  final String? photographer;
  final String? title;
  final String? details;
  final int index;
  const Details(
      {Key? key,
      this.imagePath,
      this.price,
      this.photographer,
      this.title,
      this.details, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: SafeArea(
        child: Container(
          child: Column(
            
            children: [
              Expanded(
                  child: Hero(
                    tag: "logo$index",
                    child: Container(
                                decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                          image: AssetImage(imagePath.toString()),
                          fit: BoxFit.cover)),
                              ),
                  )),
              // ignore: sized_box_for_whitespace
              Container(
                height: 260,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title.toString(),
                                style: const TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600)),
                            Text("by $photographer".toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                )),
                            Text(price.toString(),
                                style: const TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(details.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            color: Colors.lightBlueAccent,
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: FlatButton(
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            color: Colors.lightBlueAccent,
                            child: const Text(
                              "BUY",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
