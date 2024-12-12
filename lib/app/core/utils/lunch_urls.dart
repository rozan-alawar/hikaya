// lib/app/core/utils/url_launcher_util.dart
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/connectivity_service.dart';
import 'snackbar_util.dart';

class URLLauncherUtil {
  static Future<void> launchURL(String url) async {
    // Check connectivity first
    if (!await ConnectivityService.to.checkConnection()) {
      SnackbarUtil.showError(
          'No Internet Connection',
          'Please check your network connection and try again.'
      );
      return;
    }

    try {
      // Format URL
      String urlString = url.trim();
      if (!urlString.startsWith('http://') && !urlString.startsWith('https://')) {
        urlString = 'https://$urlString';
      }

      final Uri uri = Uri.parse(urlString);

      // Try external application first
      try {
        final bool launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (launched) return;
      } catch (e) {
        debugPrint('External launch failed, trying platform default: $e');
      }

      // Try platform default as fallback
      try {
        final bool launched = await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
        if (launched) return;
      } catch (e) {
        debugPrint('Platform default launch failed: $e');
      }

      SnackbarUtil.showError(
          'Launch Failed',
          'Could not open URL. Please check if you have a browser installed.'
      );

    } catch (e) {
      debugPrint('URL launch error: $e');
      SnackbarUtil.showError(
          'Invalid URL',
          'The provided URL format is invalid.'
      );
    }
  }
}