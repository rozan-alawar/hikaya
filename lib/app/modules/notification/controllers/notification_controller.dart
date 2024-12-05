import 'package:get/get.dart';
import 'package:hikaya/app/models/notification_model.dart';

class NotificationController extends GetxController {
    final RxList<NotificationModel> notifications = <NotificationModel>[
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
  ].obs;

  void clearAllNotifications() {
    notifications.clear();
  }
}
