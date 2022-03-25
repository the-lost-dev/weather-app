import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 3,
                  vertical: SizeConfig.blockSizeVertical * 1.5,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New York',
                              style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
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
                        const Spacer(),
                        const Icon(Icons.add), //TODO: add search Functionality
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 8,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.cloud_circle_outlined),
                            Text(
                              'Mostly cloudy',
                              style: GoogleFonts.sora(
                                fontSize: 18,
                              ),
                            ),
                          ],
                          
                        ),
                        const Spacer(),
                        const Text('34\u00B0')
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
