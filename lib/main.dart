import 'package:delimeals/Pages/meal_detailed_screen.dart';

import './Pages/categories_screen.dart';
import 'package:flutter/material.dart';

import 'Pages/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
        canvasColor: const Color.fromRGBO(225, 224, 229, 1),
        fontFamily: 'Railway',
        textTheme: Theme.of(context).textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            caption: const TextStyle(
                fontSize: 22.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)
            // titleLarge: TextStyle(
            //   fontSize: 24.0,
            //   fontFamily: 'RobotoCondensed'
            // )
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailed.routename: (ctx) => MealDetailed(),
      },
      // onGenerateRoute: (_) {
      //   print(_);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (ctx) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
