import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meals>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meals meals) {
    final mealIsFavorite = state.contains(meals);

    if (mealIsFavorite) {
      state = state.where((element) => element.id != meals.id).toList();
      return false;
    } else {
      state = [...state, meals];
      return true;
    }
  }

  bool isMarkedFavorite(String mealId) {
    return state.any((element) => element.id == mealId);
  }

}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meals>>(
        (ref) => FavoriteMealsNotifier());
