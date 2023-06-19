import 'package:ecommerce_app/models/order_response.dart';
import 'package:ecommerce_app/service/order_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../api/order/fetch_api_service.dart';
import '../service/order_detail_service.dart';
import 'get_cart_user_controller.dart';

class CreateOrderController extends GetxController {
  var list = <ProductOrder>[].obs;

  get getProductChoose => list;

  Future createOrder(
      String userId, String payment, List<ProductCart> listChoose) async {
    if (listChoose.isEmpty) return;
    var listTemp = <ProductOrder>[];
    for (var i = 0; i < listChoose.length; i++) {
      var temp = ProductOrder();
      temp.productId = listChoose[i].product!.productId!;
      temp.quantity = listChoose[i].quantity;
      listTemp.add(temp);
    }
    list.value = listTemp;
    Logger().i(list.length);
    Logger().i('log order ${list[0].productId} ${list[0].quantity}');
    await FetchApiOrderService.createOrder(userId, payment, getProductChoose);
    listChoose.clear();
    return;
  }
}

class OrderController extends GetxController {
  var listAllOrder = <Orders>[].obs;

  set setlistAllOrder(value) => listAllOrder = value;

  Future loadListOrder(String userId) async {
    final res = await OrderService.instance.getAllOrder(userId);

    listAllOrder.value = res!.data!;

    for (var orders in listAllOrder) {
      final res2 =
          await OrderDetailService.instance.getOrderDetailByOrderId(orders.id!);
      orders.orderDetail = res2!.data!;
    }

    Logger().i('Log order ${listAllOrder.length}');
  }
}
