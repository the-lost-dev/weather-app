import 'package:flutter/material.dart';

class TempDetail extends StatelessWidget {
  const TempDetail({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
