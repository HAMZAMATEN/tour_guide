import 'package:get/get.dart';

import 'controller.dart';

// import '../../welcome/controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController> ( () => WelcomeController());
  }

}