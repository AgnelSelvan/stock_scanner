import 'package:flutter/material.dart';
import 'package:stock_scanner/app.dart';

import 'di.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}
