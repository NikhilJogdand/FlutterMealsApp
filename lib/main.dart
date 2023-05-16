import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals.dart';
import '../providers/meals_provider.dart';
import '../screens/category_meal_screen.dart';
import '../screens/category_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Map<String, bool> currentFilters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.white,
        // fontFamily: 'Railway'
        // textTheme: ThemeData.light().textTheme.copyWith(
        //   bodyText1: const TextStyle(
        //     color: Color.fromARGB(20, 51, 51, 1)
        //   ),
        //     bodyText2: const TextStyle(
        //     color: Color.fromARGB(20, 51, 51, 1)
        //   ),
        //   titleMedium: TextStyle(
        //     fontSize: 24,
        //     fontFamily: 'RobotoCondensed'
        //   )
        // )
      ),
      // home: const CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
      },
    );
  }
}
