import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subtitle;

  CustomCard({
    required this.assetPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 180,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(
                  image: AssetImage(assetPath),
                  fit: BoxFit.cover,
                  height: 120.0,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                )),
                overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                maxLines: 2, // Maximum of 2 lines for title
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                subtitle,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600],
                )),
                overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                maxLines: 1, // Maximum of 2 lines for subtitle
              ),
            ),
          ],
        ),
      ),
    );
  }
}
