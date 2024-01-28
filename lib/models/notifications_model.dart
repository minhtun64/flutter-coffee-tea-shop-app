class NotificationsItem {
  final String id;
  final String title;
  final String content;
  bool isRead;

  NotificationsItem({
    required this.id,
    required this.title,
    required this.content,
    required this.isRead,
  });
}

List<NotificationsItem> notifications = [
  NotificationsItem(
    id: '1',
    title: 'Thông báo 1',
    content: 'Nội dung chi tiết của thông báo 1.',
    isRead: false,
  ),
  NotificationsItem(
    id: '2',
    title: 'Thông báo 2',
    content: 'Nội dung chi tiết của thông báo 2.',
    isRead: true,
  ),
  NotificationsItem(
    id: '3',
    title: 'Thông báo 3',
    content: 'Nội dung chi tiết của thông báo 3.',
    isRead: false,
  ),
  NotificationsItem(
    id: '4',
    title: 'Thông báo 4',
    content: 'Nội dung chi tiết của thông báo 4.',
    isRead: false,
  ),
  NotificationsItem(
    id: '5',
    title: 'Thông báo 5',
    content:
        'Nội dung chi tiết của thông báo 5.Nội dung chi tiết của thông báo 5.Nội dung chi tiết của thông báo 5.Nội dung chi tiết của thông báo 5.Nội dung chi tiết của thông báo 5.',
    isRead: true,
  ),
  NotificationsItem(
    id: '6',
    title: 'Thông báo 6',
    content: 'Nội dung chi tiết của thông báo 6.',
    isRead: false,
  ),
  // Add more notifications as needed
];
