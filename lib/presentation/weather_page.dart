import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';

import 'components/components.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: mainPadding,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
              AppColors.utilityColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sizedBox4,
              Text(
                'San Francisco', //TODO: Name of the region
                style: Theme.of(context).textTheme.headline1,
              ),
              sizedBox2,
              Text(
                'May 28, 2021', //TODO: Today's Date
                style: Theme.of(context).textTheme.headline2,
              ),
              sizedBox6,
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.cloudy_snowing,
                  size: SizeConfig.blockSizeHorizontal * 50,
                ),
              ),
              Row(
                children: const [
                  TempDetail(
                    title: Strings.temp,
                    subTitle: '32',
                  ),
                  TempDetail(
                    title: Strings.temp,
                    subTitle: '32\u00B0',
                  ),
                  TempDetail(
                    title: Strings.temp,
                    subTitle: '32',
                  ),
                ],
              ),
              Container(
                height: 50,
                width: double.infinity, // TODO: WEATHER FORECAST SIDE
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
