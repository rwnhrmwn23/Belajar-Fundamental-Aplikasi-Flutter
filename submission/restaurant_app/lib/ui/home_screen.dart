import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/ui/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildListRestaurant(context)
      ),
    );
  }
}

Widget _buildListRestaurant(BuildContext context) {
  return FutureBuilder<String>(
    future:
    DefaultAssetBundle.of(context).loadString('assets/restaurants.json'),
    builder: (context, snapshot) {
      final List<RestaurantDetail> restaurants =
          restaurantFromJson(snapshot.requireData).restaurants;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${restaurants.length} Restaurant Found',
            style: Theme
                .of(context)
                .textTheme
                .headline5),
          Expanded(
            child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return _buildListDetailRestaurant(
                      context, restaurants[index]);
                }),
          ),
        ],
      );
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
            style: Theme
                .of(context)
                .textTheme
                .bodyText2,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 12,
                ),
              ),
              SizedBox(width: 8),
              Text(restaurants.city)
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, DetailScreen.routeName,
                arguments: restaurants);
          },
        ),
      ),
    ),
  );
}
