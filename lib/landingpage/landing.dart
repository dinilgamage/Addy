import 'package:addy/colors/themes.dart';
import 'package:flutter/material.dart';
import 'package:addy/colors/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Image(
                    image: AssetImage('assets/landing.png'),
                  ),
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Advertise',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors
                          .secondaryLight, // Change text color as needed
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' with Ease, Reach your ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white, // Change color as needed
                        ),
                      ),
                      TextSpan(
                        text: 'Audience',
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors
                              .secondaryLight, // Change color as needed
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 270,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
