import 'package:ecommerce_app/api/order-detail/fetch_api_service.dart';
import 'package:ecommerce_app/models/order_detail_response.dart';

class OrderDetailService {
  static final OrderDetailService instance = OrderDetailService._internal();
  factory OrderDetailService() {
    return instance;
  }

  OrderDetailService._internal();

  Future<OrderDetailResponse?> getOrderDetailByOrderId(String orderId) {
    return FetchApiOrderDetailService.instance.getOrderDetailByOrderId(orderId);
  }
}
