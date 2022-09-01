import 'package:equatable/equatable.dart';

import 'shop_model.dart';

class WishList extends Equatable {
  final List<Shoping> products;

  const WishList({
    this.products = const <Shoping>[],
  });

  @override
  List<Object?> get props => [products];
}
