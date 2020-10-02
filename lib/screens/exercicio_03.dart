import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:trabalho/screens/home.dart';

class Exercicio_03 extends StatefulWidget {
  @override
  _Exercicio_03State createState() => _Exercicio_03State();
}

class _Exercicio_03State extends State<Exercicio_03> {
  TextEditingController _valorController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  List notas;

  static const platform = const MethodChannel("channel");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cédulas"),
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
                height: 8.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _valorController,
                decoration: InputDecoration(
                    labelText: "Valor",
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
                        await _exercicio03(_valorController.text);
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

  abrirDialog() async {
    AlertDialog result = AlertDialog(
      title: Text("Exemplo de Saída"),
      content: Text(
        "${notas[0]} nota(s) de R\$ 100,00\n${notas[1]} nota(s) de R\$ 50,00\n${notas[2]} nota(s) de R\$ 20,00\n${notas[3]} nota(s) de R\$ 10,00\n${notas[4]} nota(s) de R\$ 5,00\n${notas[5]} nota(s) de R\$ 2,00\n${notas[6]} nota(s) de R\$ 1,00\n",
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "OK",
            style: TextStyle(fontSize: 22.0),
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
    _valorController.text = "";
    setState(() {
      _formkey = GlobalKey<FormState>();
    });
  }

  Future _exercicio03(
    nota,
  ) async {
    try {
      final List result = await platform
          .invokeMethod("_exercicio03", {"nota": _valorController.text});
      notas = result;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
