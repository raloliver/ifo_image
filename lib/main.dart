import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './scoped-models/item.dart';
import './pages/home.dart';

void main() => runApp(DodIimageApp());

class DodIimageApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DodIimageApp();
  }
}

class _DodIimageApp extends State<DodIimageApp> {
  final ItemsModel _model = ItemsModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ItemsModel>(
        model: _model,
        child: MaterialApp(
          title: 'IOF Image Picker',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            primaryColor: Colors.amber,
            accentColor: Colors.amberAccent,
            canvasColor: Colors.white,
            fontFamily: 'Roboto',
          ),
          home: Home(),
        ));
  }
}
