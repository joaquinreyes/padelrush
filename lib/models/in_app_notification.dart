class InAppNotification {
  String? id;
  int? customerId;
  int? serviceBookingId;
  String? serviceType;
  String? bookingType;
  String? title;
  String? body;
  bool? isRead;
  DateTime? createdAt;

  InAppNotification({
    this.id,
    this.customerId,
    this.serviceBookingId,
    this.serviceType,
    this.bookingType,
    this.title,
    this.body,
    this.isRead,
    this.createdAt,
  });

  factory InAppNotification.fromJson(Map<String, dynamic> json) {
    return InAppNotification(
      id: json['_id'],
      customerId: json['customer_id'],
      serviceBookingId: json['service_booking_id'],
      serviceType: json['service_type'],
      bookingType: json['booking_type'],
      title: json['title'],
      body: json['body'],
      isRead: json['is_read'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'customer_id': customerId,
      'service_booking_id': serviceBookingId,
      'service_type': serviceType,
      'booking_type': bookingType,
      'title': title,
      'body': body,
      'is_read': isRead,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

class NotificationResponse {
  List<InAppNotification>? data;
  String? message;

  NotificationResponse({
    this.data,
    this.message,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => InAppNotification.fromJson(e))
              .toList()
          : null,
      message: json['message'],
    );
  }
}

class UnreadCountResponse {
  bool? success;
  int? unreadCount;
  String? message;

  UnreadCountResponse({
    this.success,
    this.unreadCount,
    this.message,
  });

  factory UnreadCountResponse.fromJson(Map<String, dynamic> json) {
    return UnreadCountResponse(
      success: json['success'],
      unreadCount: json['data'] != null ? json['data']['unread_count'] : 0,
      message: json['message'],
    );
  }
}
