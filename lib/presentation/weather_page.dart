import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'New York',
                              style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ), //TODO: Insert City Name
                            Text(
                              'Today, Aug 11 15:05',
                              style: GoogleFonts.sora(
                                fontSize: 16,
                              ),
                            ), //TODO: Insert Current Date and Time
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
