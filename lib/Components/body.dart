import 'package:flutter/material.dart';
import 'package:login_page/Screens/SignUp/singup_screen.dart';

import '../Screens/LOGIN/components/background.dart';
import '../Screens/LOGIN/login.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 150,
                    child: const Center(
                      child: Text(
                        "Ideal store for your shopping" ,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      )
                    ),
                    const SizedBox(height: 80,),
                    Container(
                      width: 200,
                      child: Column(
                         children: [
                           Container(
                             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                             child: SizedBox(
                               width: 800,
                               child: TextButton(
                                 child: const Text("SIGN UP", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                 onPressed: (){
                                   setState(() {
                                     Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                          return const SignUpScreen();
                                        })));
                                   });
                                 },
                               ),
                             ),
                           ),
                           const SizedBox(height: 20,),
                           Container(
                             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                             child: SizedBox(
                               width: 800,
                               child: TextButton(
                                 child: const Text("LOGIN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                 onPressed: (){
                                   setState(() {
                                     Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                          return const LoginScreen();
                                        })));
                                   });
                                 },
                               ),
                             ),
                           ),
                         ],
                      ),
                    )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
