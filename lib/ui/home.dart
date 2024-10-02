import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/restaurant_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              backgroundColor: const Color.fromRGBO(82, 26, 26, 1),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Restaurant Apps',
                  style: TextStyle(color: Colors.white),
                ),
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/14',
                      fit: BoxFit.cover,
                    ),
                    Container(color: const Color.fromRGBO(82, 26, 26, 0.7)),
                  ],
                ),
              ),
            ),
          ];
        },
        body: const RestaurantList(),
      ),
    );
  }
}
