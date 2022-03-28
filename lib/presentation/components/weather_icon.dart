
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    Key? key,
    required this.iconURL,
  }) : super(key: key);

  final String iconURL;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iconURL,
    );
  }
}
