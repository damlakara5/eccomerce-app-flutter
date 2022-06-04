import 'package:flutter/material.dart';
import 'package:login_page/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(profileUrl), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daniel",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Member since 2022",
                      style: TextStyle(
                          fontSize: 13, color: Colors.black.withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "EDIT ACCOUNT",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(12))),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconRow(
                  icon: FontAwesomeIcons.box,
                  text: "Orders",
                ),
                IconRow(
                  icon: Icons.place,
                  text: "My address",
                ),
                IconRow(
                  icon: FontAwesomeIcons.gear,
                  text: "Settings",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: List.generate(accountList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(accountList[index], style: const TextStyle(fontSize: 16),),
                          Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.5), size: 17,)
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Divider(color: Colors.grey.withOpacity(0.8),)
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class IconRow extends StatelessWidget {
  String? text;
  IconData? icon;
  IconRow({Key? key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text.toString(),
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
