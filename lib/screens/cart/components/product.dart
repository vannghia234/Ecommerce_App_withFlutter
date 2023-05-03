// ignore_for_file: public_member_api_docs, sort_constructors_first

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

class CartProduct {
  product products;
  int quantity;
  bool isSelected;

  CartProduct({
    required this.products,
    required this.quantity,
    this.isSelected = false,
  });
}

List<product> products = [
  product(name: 'Product 1', price: 20, img: "shoes2"),
  product(name: 'Product 2', price: 20, img: "product 1 image"),
  product(name: 'Product 3', price: 20, img: "shoes2"),
  product(name: 'Product 4', price: 20, img: "shoes2"),
  product(name: 'Product 5', price: 20, img: "shoes2"),
  product(name: 'Product 6', price: 20, img: "shoes2"),
  product(name: 'Product 7', price: 20, img: "shoes2"),
];

List<CartProduct> cartProducts = [
  CartProduct(products: products[0], quantity: 1),
  CartProduct(products: products[1], quantity: 1),
  CartProduct(products: products[2], quantity: 1),
  CartProduct(products: products[3], quantity: 1),
  CartProduct(products: products[4], quantity: 1),
  CartProduct(products: products[5], quantity: 1),
  CartProduct(products: products[6], quantity: 1),
];

List<CartProduct> chooseProduct = <CartProduct>[];
