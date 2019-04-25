import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('IFO Image Picker'),
        ),
        body: new Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.amber,
                  width: 2.0,
                ),
                onPressed: () {},
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
              )
            ],
          ),
        ));
  }
}
