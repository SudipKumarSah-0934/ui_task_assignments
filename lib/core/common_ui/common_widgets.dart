import 'package:fluttertoast/fluttertoast.dart';

class CommonWidgets {
  static void toastMsg(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
