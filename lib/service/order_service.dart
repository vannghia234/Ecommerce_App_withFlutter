import 'package:ecommerce_app/api/order/fetch_api_service.dart';
import 'package:ecommerce_app/models/order_response.dart';

class OrderService {
  static final OrderService instance = OrderService._internal();
  factory OrderService() {
    return instance;
  }

  OrderService._internal();

  Future<OrderResponse?> getAllOrder(String userId) {
    return FetchApiOrderService().getOrderByUserId(userId);
  }
}
