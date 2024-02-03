import 'package:doctor_app/dashboard/screen/appointment_screen/appointment_screen.dart';
import 'package:doctor_app/dashboard/screen/home_screen/home_screen.dart';
import 'package:doctor_app/dashboard/screen/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

class DashboardCnt extends GetxController {
  final List pages = [
    const HomeScreen(),
    const AppointmentScreen(),
    const ProfileScreen()
  ].obs;

  var selectedIndex = 0.obs;
}
