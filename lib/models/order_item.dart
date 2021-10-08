import 'package:recommendinator/models/order.dart';

import '../models/menu_item.dart';
import '../models/modifier.dart';

class OrderItem {
  MenuItem item;
  Modifier? modifier;

  OrderItem(
    this.item,
    this.modifier,
  );

  factory OrderItem.fromJSON(Map<String, dynamic> json) {
    return OrderItem(MenuItem.fromJSON(json["item"]), json["modifier"]);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["modifier"] = modifier;
    map["item"] = item.toMap();
    return map;
  }
}
