import 'package:customer_app/utils/GetXNetworkManager.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager(), fenix: true);
  }
}
