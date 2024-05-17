import 'package:meals/models/meal.dart';
import 'package:riverpod/riverpod.dart';

class FavouritesMealNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((ml) => ml.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesMealProvider =
    StateNotifierProvider<FavouritesMealNotifier, List<Meal>>(
  (ref) => FavouritesMealNotifier(),
);
