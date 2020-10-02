import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:trabalho/screens/home.dart';

class Exercicio_01 extends StatefulWidget {
  @override
  _Exercicio_01State createState() => _Exercicio_01State();
}

class _Exercicio_01State extends State<Exercicio_01> {
  TextEditingController _valor1Controller = TextEditingController();
  TextEditingController _valor2Controller = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  int valor;

  static const platform = const MethodChannel("channel");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extremamente Básico"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _valor1Controller,
                decoration: InputDecoration(
                    labelText: "Valor 1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue[500], fontSize: 25.0),
                validator: (text) {
                  if (text.isEmpty) {
                    return "Insira um valor";
                  }
                  if (text.contains(".") || text.contains(",")) {
                    return "Insira um valor inteiro";
                  }
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _valor2Controller,
                decoration: InputDecoration(
                    labelText: "Valor 2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue[500], fontSize: 25.0),
                validator: (text) {
                  if (text.isEmpty) {
                    return "Insira um valor";
                  }
                  if (text.contains(".") || text.contains(",")) {
                    return "Insira um valor inteiro";
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 70,
                child: RaisedButton(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0XFF0D47A1),
                            Color(0XFF1976D2),
                            Color(0XFF42A5F5),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Enviar",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        await _exercicio01(
                            _valor1Controller.text, _valor2Controller.text);
                        _resetFields();
                        abrirDialog();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  abrirDialog() {
    AlertDialog result = AlertDialog(
      title: Text("Exemplo de Saída"),
      content: Text(
        "X = $valor",
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "OK",
            style: TextStyle(fontSize: 18.0),
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ],
    );
    showDialog(context: context, child: result);
  }

  void _resetFields() {
    _valor1Controller.text = "";
    _valor2Controller.text = "";
    setState(() {
      _formkey = GlobalKey<FormState>();
    });
  }

  Future _exercicio01(valor1, valor2) async {
    try {
      final int result = await platform.invokeMethod("_exercicio01",
          {"valor1": _valor1Controller.text, "valor2": _valor2Controller.text});
      valor = result;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
