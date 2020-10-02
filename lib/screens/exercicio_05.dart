import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:trabalho/screens/home.dart';

class Exercicio_05 extends StatefulWidget {
  @override
  _Exercicio_05State createState() => _Exercicio_05State();
}

class _Exercicio_05State extends State<Exercicio_05> {
  TextEditingController _quantTestController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _larguraController = TextEditingController();
  TextEditingController _galhoController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  List resultado;

  static const platform = const MethodChannel("channel");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A Árvore de Natal"),
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
                controller: _quantTestController,
                decoration: InputDecoration(
                    labelText: "Quantidade de testes",
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
                controller: _alturaController,
                decoration: InputDecoration(
                    labelText: "Altura da árvore",
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
                controller: _larguraController,
                decoration: InputDecoration(
                    labelText: "Largura da árvore",
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
                controller: _galhoController,
                decoration: InputDecoration(
                    labelText: "Quantidade de galhos",
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
                        // await _exercicio05(
                        //     _quantTestController.text,
                        //     _alturaController.text,
                        //     _larguraController.text,
                        //     _galhoController.text);
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
        "${resultado}",
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
    _quantTestController.text = "";
    _alturaController.text = "";
    _larguraController.text = "";
    _galhoController.text = "";
    setState(() {
      _formkey = GlobalKey<FormState>();
    });
  }

  // Future _exercicio05(list) async {
  //   var params = <String, dynamic>{
  //     "from": [1, 2, 3]
  //   };
  //   try {
  //     List result = await platform.invokeMethod("_exercicio05", params);
  //     print(">> Resultado:  $result");
  //   } on PlatformException catch (e) {
  //     print(e.message);
  //   }
  // }
}
