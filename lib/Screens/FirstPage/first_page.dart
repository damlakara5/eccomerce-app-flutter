// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_page/constants.dart';
import 'package:login_page/gallery.dart';
import '../../widgets/custom_carousel.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeImg), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 15,
                    ), //space between icons,
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Winter Collection",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "DISCOVER",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          HeaderWithButton(text: "CATEGORIES"),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            // second slider
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0), //padding between photons on the slider
                  child: Container(
                    width: 180,
                    height: 220,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      categories[index]["imgUrl"].toString()),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              categories[index]["title"].toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          HeaderWithButton(text: "Recomended For you"),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(recommends.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Container(
                        width: 140,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              recommends[index]["imgUrl"].toString()),
                              fit: BoxFit.cover
                            ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recommends[index]["title"].toString(), 
                                style: TextStyle(
                                  color: Colors.black,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                            SizedBox(height: 5,),
                            Text("\$" + recommends[index]["price"].toString(), 
                                style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          CustomeCarouselHomePage(
            items: slider,
          ),
           SizedBox(
            height: 40,
          ),
          HeaderWithButton(
            text: "Recently Viewed",
          ),
           SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(recently.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Container(
                        width: 140,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              recently[index]["imgUrl"].toString()),
                              fit: BoxFit.cover
                            ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recently[index]["title"].toString(), 
                                style: TextStyle(
                                  color: Colors.black,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                            SizedBox(height: 5,),
                            Text("\$" + recently[index]["price"].toString(), 
                                style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class HeaderWithButton extends StatefulWidget {
  String? text;
  HeaderWithButton({Key? key, this.text}) : super(key: key);

  @override
  State<HeaderWithButton> createState() => _HeaderWithButtonState();
}

class _HeaderWithButtonState extends State<HeaderWithButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return  Gallery();
                      }));
                  });
                },
                child: const Text(
                    "All",
                    style: TextStyle(color: Colors.grey),
                  ),
              ),
              
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}
