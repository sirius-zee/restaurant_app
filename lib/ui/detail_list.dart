import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widget/expanded_widget.dart';
import 'package:restaurant_app/widget/list_horizontal.dart';

class DetailList extends StatelessWidget {
  final Restaurant data;
  const DetailList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(82, 26, 26, 1),
        title: Text('Detail ${data.name}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    data.pictureId,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name,
                          style: Theme.of(context).textTheme.headlineSmall),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(data.city,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          size: 24, color: Colors.amber),
                      Text('${data.rating}',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 230, 230, 230),
              ),
              ExpandedWidget(text: data.description),
              const SizedBox(height: 10),
              ListHorizontal(
                title: "Food's",
                data: data.menus.foods,
                icon: Icons.fastfood_rounded,
                iconColor: Colors.orangeAccent,
              ),
              const SizedBox(height: 15),
              ListHorizontal(
                title: "Drink's",
                data: data.menus.drinks,
                icon: Icons.local_drink_sharp,
                iconColor: Colors.lightBlueAccent,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
