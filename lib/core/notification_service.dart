/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:25 pm
 * Email: aamilraza56@gmail.com

 ***/

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
    InitializationSettings(android: androidSettings);

    await _notificationsPlugin.initialize(settings);
    tz.initializeTimeZones();
  }

  static Future<void> scheduleDailyNotification() async {
    await _notificationsPlugin.zonedSchedule(
      0,
      'Daily Expense Reminder',
      'Don\'t forget to log your expenses today!',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)), // Change to your preferred time
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
          'Daily Reminder',
          importance: Importance.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // Required parameter
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
