import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  try {
    // Ensure URL is properly formatted
    String urlString = url.trim();
    if (!urlString.startsWith('http://') && !urlString.startsWith('https://')) {
      urlString = 'https://$urlString';
    }

    final Uri uri = Uri.parse(urlString);

    // First try external application mode
    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (launched) return;
    } catch (e) {
      // If external launch fails, try in-app browser
      debugPrint('External launch failed, trying in-app browser: $e');
    }

    // Try launching in platform default browser
    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );
      if (launched) return;
    } catch (e) {
      debugPrint('Platform default launch failed: $e');
    }

    // If all launch attempts fail, show error
    _showErrorSnackbar('Could not open URL. Please check if you have a browser installed.');

  } catch (e) {
    debugPrint('URL launch error: $e');
    _showErrorSnackbar('Invalid URL format');
  }
}

void _showErrorSnackbar(String message) {
  Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red[100],
    colorText: Colors.red[900],
    duration: const Duration(seconds: 3),
  );
}