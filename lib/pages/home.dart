import 'dart:io';

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
  final Map<String, dynamic> _form = {'image': null};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            ],
          ),
        ),
      ),
    );
  }

  void _setImage(File image) {
    _form['image'] = image;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ItemsModel>(
      builder: (BuildContext context, Widget child, ItemsModel model) {
        final Widget pageContent = _build(context, model.selectedItem);
        return model.selectedItemIndex == -1
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Enviar Imagem'),
                  elevation: Theme.of(context).platform == TargetPlatform.iOS
                      ? 0.0
                      : 4.0,
                ),
                body: pageContent,
              );
      },
    );
  }
}
