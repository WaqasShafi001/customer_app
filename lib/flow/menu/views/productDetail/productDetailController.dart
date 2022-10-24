import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var slectedValue = 'Single'.obs;
  var quantityCounter = 1.obs;

  void increamentCounter(int? val) {
    if (val! >= 1) {
      quantityCounter.value++;
    }
  }

  void decreamentCounter(int? val) {
    if (val! > 1 ) {
      quantityCounter.value--;
    }
  }
}
