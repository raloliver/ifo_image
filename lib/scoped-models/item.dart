import 'package:scoped_model/scoped_model.dart';

import '../models/item.dart';

class ItemsModel extends Model {
  List<Item> _items = [];
  int _selectedItemIndex;

  List<Item> get items {
    return List.from(_items);
  }

  int get selectedItemIndex {
    return _selectedItemIndex;
  }

  Item get selectedItem {
    if (_selectedItemIndex == null) {
      return null;
    }
    return _items[_selectedItemIndex];
  }

  void addItem(Item item) {
    _items.add(item);
  }
}
