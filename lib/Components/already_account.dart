
import 'package:flutter/material.dart';

import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function()? press;
  const AlreadyHaveAnAccountCheck({
    Key? key, this.login=true, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
         Text(
          login ? "Don't have an account ?": "Already have an account ?",
          style: const TextStyle(color: kPrimaryColor, ),
        ),
        GestureDetector(
            onTap: press,
            child:  Text(
             login?  "SIGN UP!" : "SIGN IN!",
              style:
                  const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
