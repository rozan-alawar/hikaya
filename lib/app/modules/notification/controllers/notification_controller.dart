import 'package:get/get.dart';
import 'package:hikaya/app/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController extends GetxController {
  final RxList<NotificationModel> notifications = <NotificationModel>[].obs;
  late SharedPreferences _prefs;
  static const String NOTIFICATIONS_KEY = 'notifications';

  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    loadNotifications();
  }

  void loadNotifications() {
    final hasNotifications = _prefs.getBool(NOTIFICATIONS_KEY) ?? true;
    if (hasNotifications) {
      notifications.assignAll([
        NotificationModel(
          title: 'تم إضافة قصة مصورة جديدة',
          time: 'Sun 12:40pm',
        ),
        NotificationModel(
          title: 'تم إضافة مقالة جديدة',
          time: 'Mon 11:50pm',
        ),
        NotificationModel(
          title: 'تم إضافة قصة مصورة جديدة',
          time: 'Tue 10:56pm',
        ),
        NotificationModel(
          title: 'تم إضافة قصة مصورة جديدة',
          time: 'Wed 12:40pm',
        ),
        NotificationModel(
          title: 'تم إضافة مقالة جديدة',
          time: 'Fri 11:50pm',
        ),
        NotificationModel(
          title: 'تم إضافة مقالة جديدة',
          time: 'Sat 10:56pm',
        ),
      ]);
    }
  }

  void clearAllNotifications() async {
    notifications.clear();
    await _prefs.setBool(NOTIFICATIONS_KEY, false);
  }
}