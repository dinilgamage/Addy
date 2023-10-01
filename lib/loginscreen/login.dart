import 'package:addy/Dash.dart';
import 'package:flutter/material.dart';
import 'package:addy/registerscreen/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:addy/user_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserService userService = UserService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
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
                                  Text('Continue with Google',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 23),
                          child: Text(
                            'or',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 15)),
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
                            controller: passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 15)),
                              hintText: 'Enter your password',
                              border: InputBorder.none,
                            ),
                            obscureText: true,
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
                                  style: GoogleFonts.poppins(
                                      textStyle:
                                          TextStyle(color: Colors.white)),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () async {
                              bool isValid = await userService.validateUser(
                                  emailController.text,
                                  passwordController.text);
                              if (isValid) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Dash(),
                                  ),
                                );
                              } else {
                                // Show an error message or handle the invalid login attempt
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Invalid login credentials!')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
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
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.white)),
                              children: [
                                TextSpan(
                                    text: 'Register',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        255, 35, 93, 89)
                                                    : Color.fromARGB(
                                                        255, 112, 177, 173))))
                              ])),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
