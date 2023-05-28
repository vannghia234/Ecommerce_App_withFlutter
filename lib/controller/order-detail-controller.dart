import 'package:ecommerce_app/models/order_detail_response.dart';
import 'package:ecommerce_app/service/order_detail_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class OrderDetailController extends GetxController {
  var _listAllOrderDetail = <OrderDetails>[].obs;

  RxList<OrderDetails> get listOrderDetail => _listAllOrderDetail;

  set listAllOrderDetail(value) => _listAllOrderDetail = value;

  Future loadOrderDetail(String orderId) async {
    final res =
        await OrderDetailService.instance.getOrderDetailByOrderId(orderId);
    _listAllOrderDetail.value = res!.data!;

    Logger().i('Log Order Detail ${_listAllOrderDetail.length}');
  }
}
