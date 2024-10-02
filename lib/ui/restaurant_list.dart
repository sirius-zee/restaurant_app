import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/detail_list.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  List<Restaurant> parseArticles(String? json) {
    if (json == null) {
      return [];
    }

    final Map<String, dynamic> parsed = jsonDecode(json);
    final List<dynamic> restaurants = parsed['restaurants'];
    return restaurants.map((json) => Restaurant.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurant> restaurant = parseArticles(snapshot.data);
        return ListView.builder(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 24),
          itemCount: restaurant.length,
          itemBuilder: (context, index) {
            return _buildRestaurantItem(context, restaurant[index]);
          },
        );
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DetailList(data: restaurant);
            }),
          );
        },
        child: Hero(
          tag: restaurant.pictureId,
          child: Card(
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        restaurant.pictureId,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, error, _) => const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(restaurant.city,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Text(
                            '${restaurant.rating}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
