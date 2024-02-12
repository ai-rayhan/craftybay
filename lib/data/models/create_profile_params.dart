class CreateProfileParams {
  final String customerName;
  final String customerAddress;
  final String customerCity;
  final String customerState;
  final String customerPostCode;
  final String customerCountry;
  final String customerPhone;
  final String customerFax;
  final String shipName;
  final String shipAddress;
  final String shipCity;
  final String shipState;
  final String shipPostCode;
  final String shipCountry;
  final String shipPhone;

  CreateProfileParams(
      {required this.customerName,
      required this.customerAddress,
      required this.customerCity,
      required this.customerState,
      required this.customerPostCode,
      required this.customerCountry,
      required this.customerPhone,
      required this.customerFax,
      required this.shipName,
      required this.shipAddress,
      required this.shipCity,
      required this.shipState,
      required this.shipPostCode,
      required this.shipCountry,
      required this.shipPhone});
  Map<String, dynamic> toJson() => {
        "customerName": customerName,
        "customerAddress": customerAddress,
        "customerCity": customerCity,
        "customerState": customerState,
        "customerPostCode": customerPostCode,
        "customerCountry": customerCountry,
        "customerPhone": customerPhone,
        "customerFax": customerFax,
        "shipName": shipName,
        "shipAddress": shipAddress,
        "shipCity": shipCity,
        "shipState": shipState,
        "shipPostCode": shipPostCode,
        "shipCountry": shipCountry,
        "shipPhone": shipPhone,
      };
}
