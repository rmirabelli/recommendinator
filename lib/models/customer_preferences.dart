import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_item.dart';

class CustomerPreferences {
  List<OrderItem> items;

  CustomerPreferences(this.items);

  add(OrderItem item) {
    items.add(item);
  }

  static void persistCustomerPreferences(
      CustomerPreferences preferences) async {
    var mapItems = preferences.items.map((e) => e.toMap()).toList();
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(mapItems);
    await prefs.setString("customer_preferences", jsonString);
  }

  static Future<CustomerPreferences?> loadCustomerPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("customer_preferences");
    if (jsonString != null) {
      final jsonArray = json.decode(jsonString) as List;
      final orderItems = jsonArray.map((e) => OrderItem.fromJSON(e)).toList();
      return CustomerPreferences(orderItems);
    } else {
      return null;
    }
  }
}
