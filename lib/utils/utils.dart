

import 'package:uniname/utils/toast_utils.dart';

class Utils {

  bool validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      ToastUtil.showToast("Please enter a phone number and try again!", isError: true, isLong: true);

      return false;
    }
    else if (!regExp.hasMatch(value)) {
      ToastUtil.showToast("Please enter a valid phone number!", isError: true, isLong: true);

      return false;
    }else if (value.length <11) {
      ToastUtil.showToast("Your number is not valid!", isError: true, isLong: true);

      return false;
    }
    return true;
  }
}