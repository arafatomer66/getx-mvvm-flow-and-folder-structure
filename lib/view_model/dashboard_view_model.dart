import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uniname/model/university_model.dart';
import 'package:uniname/repository/university_repository.dart';
import 'package:uniname/utils/network_util.dart';
import 'package:uniname/utils/toast_utils.dart';


class DashboardViewModel extends GetxController with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var universityList = <University>[].obs;
  ScrollController scrollController = ScrollController();
  var pageNo = 1.obs;

  final localStorage = GetStorage();

  @override
  void onInit() async {
    super.onInit();

    // fetchHomeData();

    fetchProductListData();
  }

  _showProgressBar() {
    isLoading.value = true;
    update();
  }

  _hideProgressBar() {
    isLoading.value = false;
    update();
  }

  Future<void> fetchProductListData() async {
    _showProgressBar();
    // NetworkCheck.isOnline().then((value) async {
    //   if (value) {
        try {
          universityList.value = await ApiRepository().fetchUniversityList();

          _hideProgressBar();
        } catch (e) {
          log(e.toString());
          _hideProgressBar();
        }
        _hideProgressBar();
      }
      // else {
      //   ToastUtil.showToast("Offline");
      //   _hideProgressBar();
      // }
    // });
  // }
}
