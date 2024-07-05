// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rep1/core/colors.dart';

class NotificationsServices {
  static Future awesomeNotifications() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: "Basic Key",
              channelName: "Basic channel",
              channelDescription: "Notifiction for test",
              defaultColor: ColorManager.orangeAppColor,
              ledColor: Colors.white,
              importance: NotificationImportance.Max,
              criticalAlerts: true,
              onlyAlertOnce: true,
              playSound: true,
              channelShowBadge: true)
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: "Basic Key", channelGroupName: "G1")
        ],
        debug: true);
    await AwesomeNotifications().isNotificationAllowed().then((value) async {
      if (!value) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod);
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint("onActionReceivedMethod");
    final payload = receivedAction.payload ?? {};
    if (payload['navigate'] != 'true') {
      // to de add new cup
    }
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint("onNotificationCreatedMethod");
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint("onDismissActionReceivedMethod");
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint("onNotificationDisplayedMethod");
  }

  static Future<void> createNotifications({
    required String title,
    required String body,
    final String? sum,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtuns,
    final bool sceduled = false,
    final int? interval,
  }) async {
    print("object");
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 0,
          channelKey: "Basic Key",
          title: title,
          body: body,
          summary: sum,
          payload: payload,
          actionType: actionType,
          notificationLayout: notificationLayout,
          category: category,
          bigPicture: bigPicture,
        ),
        actionButtons: actionButtuns,
        schedule: sceduled
            ? NotificationInterval(
                interval: interval,
                timeZone:
                    await AwesomeNotifications().getLocalTimeZoneIdentifier(),
                preciseAlarm: true)
            : null);
  }
}

class ActionButtun extends StatelessWidget {
  const ActionButtun({
    Key? key,
    required this.ontap,
    required this.text,
  }) : super(key: key);
  final VoidCallback ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          ontap();
        },
        child: Container(
          color: Colors.amber,
          child: Text(text),
        ),
      ),
    );
  }
}
