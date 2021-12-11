import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/menus_item.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';

  final RestaurantDetail restaurantDetail;

  const DetailScreen({required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantDetail.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurantDetail.pictureId),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
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
                  Text(restaurantDetail.city),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(restaurantDetail.rating.toString())
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(restaurantDetail.description),
                  _buildMenus(
                      context: context,
                      title: 'Makanan',
                      menus: restaurantDetail.menus.foods),
                  _buildMenus(
                      context: context,
                      title: 'Minuman',
                      menus: restaurantDetail.menus.drinks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMenus({required BuildContext context, required String title, required List<MenusItem> menus}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Container(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 64,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menus.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(menus[index].name)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}
