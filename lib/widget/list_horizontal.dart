import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final List<String> data;

  const ListHorizontal({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.all(1),
            child: Row(
              children: List.generate(
                data.length,
                (index) {
                  final item = data[index];
                  return Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        color: const Color.fromARGB(255, 255, 234, 228),
                        shadowColor: const Color.fromRGBO(250, 250, 250, 0.3),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(icon, size: 32, color: iconColor),
                              const SizedBox(height: 8),
                              Text(
                                item,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
