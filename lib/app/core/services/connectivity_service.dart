// lib/app/core/services/connectivity_service.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool isConnected = true.obs;

  static ConnectivityService get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _startListening();
  }

  Future<void> _initConnectivity() async {
    try {
      ConnectivityResult result = (await _connectivity.checkConnectivity()) as ConnectivityResult;
      _updateConnectionStatus(result);
    } catch (e) {
      debugPrint('Connectivity initialization error: $e');
      isConnected.value = false;
    }
  }

  void _startListening() {
    try {
      _connectivity.onConnectivityChanged.listen(
            (ConnectivityResult result) {
          _updateConnectionStatus(result);
        } as void Function(List<ConnectivityResult> event)?,
        onError: (error) {
          debugPrint('Connectivity monitoring error: $error');
          isConnected.value = false;
        },
      );
    } catch (e) {
      debugPrint('Start listening error: $e');
      isConnected.value = false;
    }
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    try {
      isConnected.value = result != ConnectivityResult.none;
    } catch (e) {
      debugPrint('Update connection status error: $e');
      isConnected.value = false;
    }
  }

  Future<bool> checkConnection() async {
    try {
      final ConnectivityResult result = (await _connectivity.checkConnectivity()) as ConnectivityResult;
      return result != ConnectivityResult.none;
    } catch (e) {
      debugPrint('Check connection error: $e');
      return false;
    }
  }

  @override
  void onClose() {
    _connectivity.onConnectivityChanged.listen((event) {}).cancel();
    super.onClose();
  }
}