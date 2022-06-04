import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Components/rounded_button.dart';
import 'package:login_page/Screens/FirstPage/root_page.dart';
import 'package:login_page/Screens/SignUp/singup_screen.dart';
import '../../../services/auth.dart';
import '../../../Components/already_account.dart';
import '../../../Components/background.dart';
import '../../../Components/password_field.dart';
import '../../../Components/rounded_input.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              controller: _emailController,
              hintText: "Your email",
              onChanged: (value) {},
            ),
            PasswordField(
              controller: _passwordController,
              onChanged: (value) {
                /* setState(() {
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  CollectionReference usersRef =
                      FirebaseFirestore.instance.collection("users");
                  usersRef.add({"input": "$value"});
                }); */
              },
            ),
            RoundedButton(
                text: "LOGIN",
                press: () {
                  _authService
                      .signIn(_emailController.text, _passwordController.text)
                      .then((value) {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RootAppState()));
                  });
                }),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUpScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
