import 'package:get/get.dart';

class AppGet extends GetxController {
  int indexScreen = 0;
  bool isChecked =false;
  setIsChecked(){
    this.isChecked=!isChecked;
    update(['check']);
  }

}
