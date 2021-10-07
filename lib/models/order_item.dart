import '../models/menu_item.dart';
import '../models/modifier.dart';

class OrderItem {
  MenuItem item;
  Modifier? modifier;

  OrderItem(
    this.item,
    this.modifier,
  );
}
