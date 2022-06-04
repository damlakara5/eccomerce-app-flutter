import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Components/already_account.dart';
import 'package:login_page/Components/password_field.dart';
import 'package:login_page/Components/rounded_button.dart';
import 'package:login_page/Components/rounded_input.dart';
import 'package:login_page/Screens/LOGIN/login.dart';
import 'package:login_page/Screens/SignUp/components/background.dart';
import 'package:login_page/constants.dart';

import '../../../services/auth.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "SIGNUP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.25,
          ),
          RoundedInputField(
            controller: _emailController,
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          PasswordField(
            controller: _passwordController,
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "SIGNUP",
            press: () {
              _authService
                  .createPerson(_emailController.text, _passwordController.text)
                  .then((value) {
                      print(value);
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    });
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return const LoginScreen();
              })));
            },
          ),
          const OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                iconSrc: "assets/icons/facebook.svg",
                press: () {},
              ),
              SocialIcon(
                iconSrc: "assets/icons/google-plus.svg",
                press: () {},
              ),
              SocialIcon(
                iconSrc: "assets/icons/twitter.svg",
                press: () {},
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function()? press;
  const SocialIcon({
    Key? key,
    this.iconSrc = "",
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: kPrimaryColor),
            shape: BoxShape.circle),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
        width: size.width * 0.8,
        child: Row(
          children: [
            buildDivider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "OR",
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w600),
              ),
            ),
            buildDivider()
          ],
        ));
  }

  Expanded buildDivider() => const Expanded(
          child: Divider(
        color: Color(0xFFFD9D9D),
        height: 1.5,
      ));
}
