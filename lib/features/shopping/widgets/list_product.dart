import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Card(
            color: Colors.amber,
            elevation: 0,
            child: ListTile(
              title: Text(items[index]),
              onTap: () {
                final value = items[index];
                context.goNamed(detailsRouteName, params: {'item': value});
              },
            ),
          ),
        );
      },
    );
  }
}
