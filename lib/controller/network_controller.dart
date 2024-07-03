import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          'PLEASE CONNECT TO THE INTERNET',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        isDismissible: false,
        duration: const Duration(minutes: 30),
        backgroundColor: const Color.fromARGB(255, 172, 7, 122),
        icon: const Icon(
          Icons.wifi_off,
          color: Colors.white,
          size: 35,
        ),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (connectivityResult == ConnectivityResult.wifi) {
        Get.rawSnackbar(
          messageText: const Text(
            'CONNECTED TO WIFI',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          isDismissible: false,
          duration: const Duration(minutes: 5),
          backgroundColor: const Color.fromARGB(255, 1, 230, 20),
          icon: const Icon(
            Icons.wifi,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED,
        );
      }
    }
  }
}
