import 'package:flutter/material.dart';

import 'widgets/list_product.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(100, (i) => 'Item $i');
    return Scaffold(
      body: ListProducts(items: items),
    );
  }
}
