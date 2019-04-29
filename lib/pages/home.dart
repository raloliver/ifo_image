import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/image.dart';
import '../models/item.dart';
import '../scoped-models/item.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final Map<String, dynamic> _form = {'image': null, 'imageBase64': null};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<int> imageBytes;
  String base64Image;

  Widget _build(BuildContext context, Item item) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              ImageInput(_setImage, item),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                  child: Text('Enviar'),
                  color: Colors.amberAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(_form.values.toList()[1]);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _setImage(File image) {
    imageBytes = image.readAsBytesSync();
    base64Image = base64.encode(imageBytes);
    _form['image'] = image;
    _form['imageBase64'] = base64Image;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ItemsModel>(
      builder: (BuildContext context, Widget child, ItemsModel model) {
        final Widget pageContent = _build(context, model.selectedItem);
        return model.selectedItemIndex == -1
            ? pageContent
            : Scaffold(
                appBar: AppBar(title: Text('Enviar Imagem')),
                body: pageContent,
              );
      },
    );
  }
}
