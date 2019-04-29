import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/item.dart';

class ImageInput extends StatefulWidget {
  final Function setImage;
  final Item item;

  ImageInput(this.setImage, this.item);

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File _imageFile;

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
      });
      widget.setImage(image);
      Navigator.pop(context);
    });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                'Selecionar Imagem',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Camera'),
                onPressed: () {
                  _getImage(context, ImageSource.camera);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Galeria'),
                onPressed: () {
                  _getImage(context, ImageSource.gallery);
                },
              )
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewImage = Text('Por favor, escolha uma foto.');
    List<int> imageBytes;
    String base64Image;

    if (_imageFile != null) {
      previewImage = Image.file(_imageFile,
          fit: BoxFit.cover,
          height: 300.0,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter);
      imageBytes = _imageFile.readAsBytesSync();
      base64Image = base64.encode(imageBytes);
    }
    return Column(
      children: <Widget>[
        OutlineButton(
          borderSide: BorderSide(
            color: Colors.amber,
            width: 2.0,
          ),
          onPressed: () {
            _openImagePicker(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                color: Colors.amberAccent,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Selecionar Imagem',
                style: TextStyle(color: Colors.amberAccent),
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        previewImage
      ],
    );
  }
}
