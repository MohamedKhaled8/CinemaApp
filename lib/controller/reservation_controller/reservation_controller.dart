import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ReservationController extends GetxController {
  onSeatTapped(String seatNum);
  onDateTapped(index);
  onTimeTapped(String time);
  getTotalPrice();
  isSeatSelected(String seatNum);
}

class ReservationImp extends ReservationController {
  final items = List<DateTime>.generate(15, (index) {
    return DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(Duration(days: index));
  });

  DateTime selectedTime = DateTime.now();
  List<String> selectedSeats = [];
  List<String> reservedSeats =
      []; // You need to populate this list with reserved seats

  @override
  void onSeatTapped(String seatNum) {
    if (selectedSeats.contains(seatNum)) {
      selectedSeats.remove(seatNum);
    } else if (!reservedSeats.contains(seatNum)) {
      selectedSeats.add(seatNum);
    }
    update();
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onDateTapped(index) {
    selectedTime = index;
    update();
  }

  @override
  void onTimeTapped(String time) {
    selectedTime = DateTime.utc(
      selectedTime.year,
      selectedTime.month,
      selectedTime.day,
      int.parse(time.split(':')[0]),
      int.parse(time.split(':')[1]),
    );
    update();
  }

  @override
  double getTotalPrice() {
    return selectedSeats.length * 43.5;
  }

  @override
  bool isSeatSelected(String seatNum) {
    return selectedSeats.contains(seatNum);
  }
}
