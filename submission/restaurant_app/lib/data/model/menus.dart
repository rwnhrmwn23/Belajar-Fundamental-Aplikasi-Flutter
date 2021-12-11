import 'menus_item.dart';

class Menus {
  List<MenusItem> foods;
  List<MenusItem> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<MenusItem>.from(json["foods"].map((x) => MenusItem.fromJson(x))),
        drinks: List<MenusItem>.from(json["drinks"].map((x) => MenusItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
