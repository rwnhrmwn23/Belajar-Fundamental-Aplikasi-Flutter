import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/ui/detail_screen.dart';
import 'package:restaurant_app/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CaRes',
        theme: ThemeData(
          primaryColor: primaryColor,
          textTheme: myTextTheme,
          appBarTheme: AppBarTheme(
            color: primaryColor,
            elevation: 0,
          ),
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          DetailScreen.routeName: (context) => DetailScreen(
              restaurantDetail: ModalRoute.of(context)?.settings.arguments
                  as RestaurantDetail),
        });
  }
}
