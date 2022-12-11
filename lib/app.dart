import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:stock_scanner/core/colors.dart';
import 'package:stock_scanner/core/routes/routes.dart';
import 'package:stock_scanner/presentation/bloc/stock_bloc.dart';

import 'di.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => di.locator<StockBloc>(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppColors.getTheme,
          initialRoute: Routes.home,
          onGenerateRoute: RouterGenerator.generateRoutes,
        ),
      );
    });
  }
}
