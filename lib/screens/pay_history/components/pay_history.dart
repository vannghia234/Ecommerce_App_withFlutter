// ignore_for_file: public_member_api_docs, sort_constructors_first

class Order {
  DateTime date;
  int totalPrice;
  int quantity;
  String status;
  Order({
    required this.date,
    required this.totalPrice,
    required this.quantity,
    required this.status,
  });
}

List<Order> test = <Order>[];

// class OrderDetail {
//   Order order;
//   product products;
//   int quantity;
//   OrderDetail({
//     required this.order,
//     required this.products,
//     required this.quantity,
//   });
// }

List<Order> check = [
  Order(
      date: DateTime(2023, 05, 05),
      totalPrice: 30000,
      status: "Đã giao",
      quantity: 2),
  Order(
      date: DateTime(2023, 05, 04),
      totalPrice: 10000,
      status: "Đang giao",
      quantity: 2),
  Order(
      date: DateTime(2023, 05, 03),
      totalPrice: 20000,
      status: "Đã hủy",
      quantity: 2),
  Order(
      date: DateTime(2023, 05, 02),
      totalPrice: 50000,
      status: "Đã giao",
      quantity: 2),
];

// List<OrderDetail> checkDetail = [
//   OrderDetail(order: check[0], products: products[0], quantity: 1),
//   OrderDetail(order: check[0], products: products[1], quantity: 1),
//   OrderDetail(order: check[1], products: products[2], quantity: 1),
//   OrderDetail(order: check[1], products: products[3], quantity: 1),
//   OrderDetail(order: check[2], products: products[5], quantity: 1),
//   OrderDetail(order: check[2], products: products[4], quantity: 1),
//   OrderDetail(order: check[3], products: products[2], quantity: 1),
//   OrderDetail(order: check[3], products: products[2], quantity: 1),
// ];
