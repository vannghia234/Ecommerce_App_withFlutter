// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_app/controller/get_cart_user_controller.dart';

class product {
  final String name;
  final int price;
  final String img;

  product({
    required this.name,
    required this.price,
    required this.img,
  });
}

List<product> products = [
  product(name: 'Product 1', price: 120000, img: "img11"),
  product(name: 'Product 2', price: 20000, img: "img1"),
  product(name: 'Product 3', price: 120000, img: "img13"),
  product(name: 'Product 4', price: 500000, img: "img14"),
  product(name: 'Product 5', price: 80000, img: "img18"),
  product(name: 'Product 6', price: 10000, img: "img6"),
  product(name: 'Product 7', price: 30500, img: "img1"),
];

