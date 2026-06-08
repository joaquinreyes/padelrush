class WalletInfo {
  WalletInfo({
    required this.id,
    required this.customerId,
    required this.currency,
    required this.balance,
    this.expiryDate,
  });

  int id;
  int customerId;
  String currency;
  double balance;
  String? expiryDate;

  DateTime? get expiryDateTime => expiryDate != null ? DateTime.tryParse(expiryDate!) : null;

  factory WalletInfo.fromJson(Map<String, dynamic> json) => WalletInfo(
        id: json["id"],
        customerId: json["customer_id"],
        currency: json["currency"],
        balance: json["balance"]?.toDouble() ?? 0.0,
        expiryDate: json["expiry_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "currency": currency,
        "balance": balance,
        "expiry_date": expiryDate,
      };
}
