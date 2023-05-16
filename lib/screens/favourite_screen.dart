import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

import '../models/meals.dart';
import '../widgets/meals_item.dart';

class FavouriteScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meals> favoriteMeals = ref.read(favoriteMealsProvider);
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('You have not maked any favorite. \n Please mark some!',
                style: TextStyle(
                  fontSize: MediaQuery.textScaleFactorOf(context) * 18,
                )),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealsItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
              );
            },
            itemCount: favoriteMeals.length);
  }
}
