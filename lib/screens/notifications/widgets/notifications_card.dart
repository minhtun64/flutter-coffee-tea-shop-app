import 'package:flutter/material.dart';

import '../../../models/notifications_model.dart';
import '../../../values/app_colors.dart';

class NotificationsCard extends StatelessWidget {
  final NotificationsItem notification;
  final VoidCallback onTap;
  final VoidCallback onUpdateUI;

  const NotificationsCard({
    Key? key,
    required this.notification,
    required this.onTap,
    required this.onUpdateUI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        if (!notification.isRead) {
          // Nếu thông báo chưa đọc, cập nhật trạng thái đã xem và giảm số lượng chưa đọc
          notification.isRead = true;
          // Giảm số lượng thông báo chưa đọc
          // Có thể lưu trạng thái này vào cơ sở dữ liệu nếu cần
          // Ví dụ: DatabaseHelper.markNotificationAsRead(notification.id);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          onUpdateUI();
        }
      },
      child: Card(
        color: notification.isRead ? Colors.white : AppColors.cardColor,
        child: ListTile(
          leading: const Icon(Icons.notification_important),
          title: Text(
            notification.title,
            maxLines: 2,
            style: const TextStyle(
                fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text(
            notification.content,
            maxLines: 2,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }
}
