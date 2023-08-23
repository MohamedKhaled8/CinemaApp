import 'package:get/get.dart';
import 'package:cinmaapp/controller/home_controller/home_controller.dart';
import 'package:cinmaapp/controller/main_controller/main_controller.dart';
import '../../controller/reservation_controller/reservation_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainControllerImp(), fenix: true);
    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    Get.lazyPut(() => ReservationImp(), fenix: true);
  }
}
