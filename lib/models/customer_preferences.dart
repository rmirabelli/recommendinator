import 'package:recommendinator/models/menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/menu_item.dart';

class CustomerPreferences {
  List<MenuItem> items;

  CustomerPreferences(this.items);

  add(MenuItem item) {
    items.add(item);
  }

  static void persistCustomerPreferences(
      CustomerPreferences preferences) async {
    var mapItems = preferences.items.map((e) => e.toMap());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("customer_preferences", mapItems);
  }

  // static Future<CustomerPreferences> loadCustomerPreferences() async {}
}
