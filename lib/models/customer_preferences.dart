import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_item.dart';

class CustomerPreferences {
  static const kCustomerPreferencesKey = "customer_preferences";
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
    await prefs.setString(kCustomerPreferencesKey, jsonString);
  }

  static Future<CustomerPreferences?> loadCustomerPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(kCustomerPreferencesKey);
    if (jsonString != null) {
      final jsonArray = json.decode(jsonString) as List;
      final orderItems = jsonArray.map((e) => OrderItem.fromJSON(e)).toList();
      return CustomerPreferences(orderItems);
    } else {
      return null;
    }
  }

  static void resetCustomerPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(kCustomerPreferencesKey);
  }
}
