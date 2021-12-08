import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildListRestaurant(context),
      ),
    );
  }
}

Widget _buildListRestaurant(BuildContext context) {
  return FutureBuilder<String>(
    future:
    DefaultAssetBundle.of(context).loadString('assets/restaurants.json'),
    builder: (context, snapshot) {
      final List<RestaurantDetail> restaurants = restaurantFromJson(snapshot.requireData).restaurants;
      return ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return _buildListDetailRestaurant(context, restaurants[index]);
        });
    },
  );
}

Widget _buildListDetailRestaurant(BuildContext context, RestaurantDetail restaurants) {
  return Material(
    child: Padding(
      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Card(
          child: ListTile(
            leading: Image.network(
              restaurants.pictureId,
              fit: BoxFit.fill,
              width: 80,
            ),
            title: Text(
              restaurants.name,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            subtitle: Text(
              restaurants.city,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ),
    ),
  );
}
