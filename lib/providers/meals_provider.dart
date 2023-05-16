import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/dummy_data.dart';

final meals = Provider((ref) {
  return DUMMY_MEALS;
},);