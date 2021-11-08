import 'package:get/get.dart';

class AppGet extends GetxController {
  //======================== Home Screen ===================
  bool isChecked = false;
  int value = -1;

  setIsChecked() {
    this.isChecked = !isChecked;
    update(['check']);
  }

  bool isChecked1 = false;
  setIsChecked1() {
    this.isChecked1 = !isChecked1;
    update(['check1']);
  }

  //===========================Option Screen====================
  dicrement() {
    value--;
    update();
  }

  increment() {
    value++;
    update();
  }

  bool promptCheck = false;
  setPromptCheck() {
    this.promptCheck = !promptCheck;
    update();
  }

  bool price1 = false;
  setPrice1() {
    this.price1 = !price1;
    update();
  }

  bool price2 = false;
  setPrice2() {
    this.price2 = !price2;
    update();
  }

  bool cost = false;
  setCost() {
    this.cost = !cost;
    update();
  }

  bool scan = false;
  setScan() {
    this.scan = !scan;
    update();
  }

  bool allow = false;
  setAllow() {
    this.allow = !allow;
    update();
  }

  bool confirm = false;
  setConfirm() {
    this.confirm = !confirm;
    update();
  }

  bool prompt = false;
  setPrompt() {
    this.prompt = !prompt;
    update();
  }

  bool promptMessage = false;
  setPromptMessage() {
    this.promptMessage = !promptMessage;
    update();
  }

  bool saveInvalidCode = false;
  setSaveInvalidCode() {
    this.saveInvalidCode = !saveInvalidCode;
    update();
  }
}
