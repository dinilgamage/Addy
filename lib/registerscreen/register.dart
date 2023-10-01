import 'package:addy/Dash.dart';
import 'package:flutter/material.dart';
import 'package:addy/loginscreen/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:addy/user_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UserService userService = UserService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  bool get canRegister =>
      passwordController.text == confirmPasswordController.text &&
      passwordController.text.isNotEmpty;

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
                      'Join us',
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
                    image: AssetImage('assets/register.png'),
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
                          padding: const EdgeInsets.symmetric(vertical: 7),
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
                            controller: fullNameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 15)),
                              hintText: 'Enter your full name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.012,
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
                          height: size.height * 0.012,
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
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 15)),
                              hintText: 'Confirm your password',
                              border: InputBorder.none,
                            ),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: canRegister
                                ? () async {
                                    await userService.writeUser(
                                        emailController.text,
                                        passwordController.text);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => Dash(),
                                      ),
                                    );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Register',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text.rich(TextSpan(
                                text: 'Already have an account?  ',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(color: Colors.white)),
                                children: [
                                  TextSpan(
                                      text: 'Login',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 35, 93, 89)
                                                  : Color.fromARGB(
                                                      255, 112, 177, 173))))
                                ]))),
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
