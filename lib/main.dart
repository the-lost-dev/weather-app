import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/root.dart';

void main() => runApp(
      const ProviderScope(
        child: Weather(),
      ),
    );