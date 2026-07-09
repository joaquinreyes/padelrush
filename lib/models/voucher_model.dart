import 'court_booking.dart';

class VoucherModel {
  int? id;
  String? voucherName;
  double? value;
  double? price;
  List<Location>? locations;
  String? expiryDate;
  int? expiryDays;

  VoucherModel(
      {this.id,
      this.voucherName,
      this.value,
      this.price,
      this.locations,
      this.expiryDate,
      this.expiryDays});

  VoucherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voucherName = json['voucher_name'];
    value = double.tryParse(json['value'].toString());
    price = double.tryParse(json['price'].toString());
    expiryDate = json['expiry_date'];
    expiryDays = json['expiry_days'] is int
        ? json['expiry_days']
        : int.tryParse(json['expiry_days']?.toString() ?? '');
    if (json['locations'] != null) {
      locations = <Location>[];
      json['locations'].forEach((v) {
        locations!.add(Location.fromJson(v));
      });
    }
  }

  DateTime? get expiryDateTime =>
      expiryDate != null ? DateTime.tryParse(expiryDate!) : null;

  bool get hasExpiry => expiryDateTime != null || expiryDays != null;

  int? get locationId {
    if (locations != null && locations!.isNotEmpty) {
      return locations![0].id;
    }
    return null;
  }
}
