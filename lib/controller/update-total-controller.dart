import 'package:get/get.dart';

class TotalController extends GetxController {
  RxInt total = 0.obs;
  RxInt count = 0.obs;
  
  void chooseProduct(int price, int quantity) {
    total += price * quantity;
    count++;
  }

  void unchosenProduct(int price, int quantity) {
    total -= price * quantity;
    count--;
  }

  void incrementTotal(int price) {
    total += price;
  }

  void decreaseTotal(int price) {
    total -= price;
  }
}