import 'package:addy/registerscreen/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Center(
            child: SafeArea(
                child: Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Dive In',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/login.png'),
                    height: size.height * 0.3,
                  ),
                  Form(
                      child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Row(
                              children: [
                                Image.asset('assets/google-logo.png'),
                                Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            hintStyle: TextStyle(fontSize: 15),
                            hintText: 'Enter your email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            hintStyle: TextStyle(fontSize: 15),
                            hintText: 'Enter your password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text.rich(TextSpan(
                              text: 'Don\'t have an account?  ',
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Color.fromARGB(255, 35, 93, 89)
                                            : Color.fromARGB(
                                                255, 112, 177, 173)))
                              ]))),
                    ],
                  ))
                ],
              ),
            )),
          ),
        ));
  }
}