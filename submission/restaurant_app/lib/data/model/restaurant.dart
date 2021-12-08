import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant_detail.dart';

class Restaurant {
  List<RestaurantDetail> restaurants;

  Restaurant({
    required this.restaurants,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
      restaurants: List<RestaurantDetail>.from(
          json['restaurants'].map((x) => RestaurantDetail.fromJson(x))));

  Map<String, dynamic> toJson() => {
        'restaurants': List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));
