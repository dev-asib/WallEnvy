import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wall_envy/presentation/ui/widgets/connectivity/show_internet_status_dialog_box.dart';

class ConnectivityController extends GetxController {
  late StreamSubscription _streamSubscription;
  RxBool isDeviceConnected = false.obs;
  RxBool isAlert = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
  }

  void _checkConnectivity() {
    try {
      _streamSubscription = Connectivity().onConnectivityChanged.listen(
        (result) async {
          try {
            isDeviceConnected.value =
                await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected.value && !isAlert.value) {
              showInternetStatusDialogBox(_handleRetry);
              isAlert.value = true;
            }
          } catch (e) {
            debugPrint("Error checking internet connection: $e");
          }
        },
      );
    } catch (e) {
      debugPrint("Error listening to connectivity changes: $e");
    }
  }

  void _handleRetry() async {
    try {
      Get.back();
      isDeviceConnected.value = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected.value) {
        showInternetStatusDialogBox(_handleRetry);
      } else {
        isAlert.value = false;
      }
    } catch (e) {
      debugPrint("Error during retry internet connection check: $e");
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}
