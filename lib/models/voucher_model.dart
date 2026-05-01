import 'court_booking.dart';

class VoucherModel {
  int? id;
  String? voucherName;
  double? value;
  double? price;
  List<Location>? locations;

  VoucherModel(
      {this.id, this.voucherName, this.value, this.price, this.locations});

  VoucherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voucherName = json['voucher_name'];
    value = double.tryParse(json['value'].toString());
    price = double.tryParse(json['price'].toString());
    if (json['locations'] != null) {
      locations = <Location>[];
      json['locations'].forEach((v) {
        locations!.add(Location.fromJson(v));
      });
    }
  }

  int? get locationId {
    if (locations != null && locations!.isNotEmpty) {
      return locations![0].id;
    }
    return null;
  }
}
