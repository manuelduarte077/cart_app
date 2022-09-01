import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Shoping extends Equatable {
  final String title;
  final String category;
  final double price;
  final bool isPopular;
  final List<String> size;
  final String color;

  const Shoping(
      {required this.title,
      required this.category,
      required this.price,
      required this.isPopular,
      required this.size,
      required this.color});

  @override
  List<Object?> get props => [title, category, price, size, isPopular, color];

  static List<Shoping> products = const [
    Shoping(
      title: 'Polkadot Red Dress',
      category: 'Trending',
      price: 1.499,
      isPopular: true,
      size: ['XS', 'S', 'M', 'L'],
      color: '#F28293',
    ),
  ];
}
