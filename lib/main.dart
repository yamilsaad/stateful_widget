import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() =>
      new _MyButtonState(); //createState es el metodo que maneja el estado de nuestro widget/Notifica la actualizacion y vuelve a renderizar el widget
}

class _MyButtonState extends State<MyButton> {
  String flutterText = "";
  int index = 0;
  List<String> collections = ['Flutter', 'es', 'GENIAL'];

  //AQUÍ VA LA LÓGICA QUE NOS VA A HACER QUE EL TEXTO SE ACTUALICE AL PRECIONAR EL BOTÓN!!!!
  void onPressButton() {
    //La siguiente funcion setState actualiza el estado del widget provocando que este sea renderizado
    setState(() {
      flutterText = collections[index];
      index = index < 2
          ? index + 1
          : 0; //lo que hace esta logica es que cuando llegue al limite de la coleccion vuelve a comenzar!!!
      /*la expresión anterior sería sin ser simplificada de la siguiente manera:
      if(index < 2){
        index = index + 1;
      }else{
        index = 0;
      }
      */
    });
  }

  @override
  Widget build(BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
        primary: Colors.purple, onPrimary: Colors.white);

    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Stateful Widget"),
          backgroundColor: Colors.deepOrangeAccent),
      body: new Container(
        child: new Center(
          //Este widget va a centrar todo lo que esté dentro de él, es decir en el container del body!!!
          child: new Column(
            mainAxisAlignment: MainAxisAlignment
                .center, //Esta PROPIEDAD VA A CENTRAR EL CONTENIDO DENTRO DEL WIDGET DE COLUMN!!!
            children: <Widget>[
              new Text(flutterText, style: new TextStyle(fontSize: 40.0)),
              new Padding(
                  padding: new EdgeInsets.all(
                      10.0)), //este PADDING va a darle a todos los lados un ancho de 10.0!!!
              new ElevatedButton(
                  style: elevatedButtonStyle,
                  onPressed: onPressButton,
                  child: new Text("Actualizar"))
            ],
          ),
        ),
      ),
    );
  }
}

