import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 1.obs;

  void onTabTapped(int index) {
    selectedIndex.value = index;
  }
}
