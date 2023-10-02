import 'dart:io';
import 'package:addy/landingpage/landing.dart';
import 'package:addy/loginscreen/login.dart';
import 'package:addy/main.dart';
import 'package:addy/user_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;
  final UserService userService = UserService();
  @override
  void initState() {
    //when screen initializes the loadimage function will load the image
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    final directory =
        await getApplicationDocumentsDirectory(); //get device document directory
    print(directory);

    ///data/user/0/com.example.addy/app_flutter
    final path = directory.path;
    final file = File('$path/profile.png');
    print(directory);
    if (file.existsSync()) {
      setState(() {
        _imageFile = file;
      });
    }
  }

  _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final file = File('$path/profile.png');
      final savedImage = await File(pickedFile.path).copy(file.path);
      setState(() {
        _imageFile = savedImage;
      });
      Navigator.pop(context); // Close the bottom sheet
    }
  }

  ImageProvider _getImageProvider() {
    if (_imageFile != null) {
      return FileImage(_imageFile!);
    }
    return AssetImage('assets/profile_blank.png');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            imageProfile(context),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Dinil Gamage',
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              height: 45,
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    await userService.setLoggedIn(false);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Text('Log out',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'My Ads',
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 4, // Specify the thickness of the line
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardItem(
                    leftImage: Image.asset(
                        'assets/card/car1.png'), // Replace with your left image
                    text: 'Mustang Shelby (Used)',

                    rightImage: Image.asset(
                        'assets/card/bin.png'), // Replace with your right image
                  ),
                  CardItem(
                    leftImage: Image.asset(
                        'assets/card/phone1.png'), // Replace with your left image
                    text: 'Iphone 15 Pro (New)',

                    rightImage: Image.asset(
                        'assets/card/bin.png'), // Replace with your right image
                  ),
                  CardItem(
                    leftImage: Image.asset(
                        'assets/card/house1.png'), // Replace with your left image
                    text: '4 bedroom apartment nugegoda, colombo, srilanka',

                    rightImage: Image.asset(
                        'assets/card/bin.png'), // Replace with your right image
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              'Choose Profile Photo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera),
                ),
                Text("Camera")
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.browse_gallery_rounded),
                ),
                Text("Gallery")
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _getImageProvider(),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => bottomSheet(context));
              },
              child: Icon(
                Icons.add_circle_rounded,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color.fromARGB(255, 35, 93, 89)
                    : Color.fromARGB(255, 112, 173, 169),
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Image leftImage;
  final String text;
  final Image rightImage;

  CardItem(
      {required this.leftImage, required this.text, required this.rightImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 90,
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: leftImage,
                  ),
                ),
                SizedBox(
                  width: 210,
                  child: Text(text,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                      maxLines: 2),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: rightImage,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//   import 'dart:io';

// void clearUserData() async {
//   final directory = await getApplicationDocumentsDirectory();
//   final path = directory.path;
//   final file = File('$path/userDetails.json');

//   if (file.existsSync()) {
//     await file.delete();
//     print('User data cleared.');
//   }
// }

// }ElevatedButton(
//   onPressed: () async {
//     await clearUserData(); // Clear user data when logging out
//     // Other logout logic
//   },
//   // ... other properties
// ),
