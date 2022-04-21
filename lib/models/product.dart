class Product {
  String? _productName;
  bool? _isSelected;
  int? _cost;

  Product({String? productName, bool? isSelected, int? cost}) {
    if (productName != null) {
      this._productName = productName;
    }
    if (isSelected != null) {
      this._isSelected = isSelected;
    }
    if (cost != null) {
      this._cost = cost;
    }
  }

  String? get productName => _productName;
  set productName(String? productName) => _productName = productName;
  bool? get isSelected => _isSelected;
  set isSelected(bool? isSelected) => _isSelected = isSelected;
  int? get cost => _cost;
  set cost(int? cost) => _cost = cost;

  Product.fromJson(Map<String, dynamic> json) {
    _productName = json['product_name'];
    _isSelected = json['isSelected'];
    _cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this._productName;
    data['isSelected'] = this._isSelected;
    data['cost'] = this._cost;
    return data;
  }
}
