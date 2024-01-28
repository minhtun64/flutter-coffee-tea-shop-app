import 'package:flutter/material.dart';

import '../../models/notifications_model.dart';
import '../../values/app_colors.dart';
import 'widgets/notifications_card.dart';

class NotificationsPage extends StatefulWidget {
  final Function updateUnreadCount;
  const NotificationsPage({super.key, required this.updateUnreadCount});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int unreadCount = 0;

  @override
  void initState() {
    super.initState();
    // notifications = getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    void markNotificationAsRead() {
      widget.updateUnreadCount();
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Thông báo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              // color: Theme.of(context).primaryColor,
              gradient: LinearGradient(colors: AppColors.defaultGradient)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationsCard(
              notification: notifications[index],
              onTap: () {
                // Xử lý khi người dùng nhấn vào thông báo
                // Có thể hiển thị chi tiết thông báo ở đây
              },
              onUpdateUI: markNotificationAsRead,
            );
          },
        ),
      ),
      floatingActionButton: unreadCount > 0
          ? FloatingActionButton(
              onPressed: () {
                // Xử lý khi người dùng nhấn vào FAB
                // Có thể chuyển hướng đến màn hình thông báo chưa đọc
              },
              child: Stack(
                children: [
                  const Icon(Icons.notifications),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Text(
                        unreadCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
