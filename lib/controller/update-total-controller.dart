import 'package:get/get.dart';

class TotalController extends GetxController {
  RxInt total = 0.obs;
  RxInt count = 0.obs;
  var isButtonEnabled = false.obs;

  void updateButtonEnabled() {
    if (count.value > 0) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  void chooseProduct(int price, int quantity) {
    total += price * quantity;
    count++;
    updateButtonEnabled();
  }

  void unchosenProduct(int price, int quantity) {
    total -= price * quantity;
    count--;
    updateButtonEnabled();
  }

  void incrementTotal(int price) {
    total += price;
  }

  void decreaseTotal(int price) {
    total -= price;
  }
}
