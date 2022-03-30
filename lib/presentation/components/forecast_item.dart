import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/utils.dart';

import 'components.dart';

class ForecastItem extends ConsumerWidget {
  const ForecastItem({
    Key? key,
    required this.date,
    required this.iconURL,
    required this.temp,
  }) : super(key: key);

  final DateTime date;
  final String iconURL;
  final String temp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: padding4,
      padding: padding4,
      width: SizeConfig.blockSizeHorizontal * 35,
      decoration: BoxDecoration(
        color: AppColors.weatherCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            DateFormat.E().format(date),
            style: Theme.of(context).textTheme.headline3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherIcon(iconURL: iconURL),
              Text(
                temp,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
