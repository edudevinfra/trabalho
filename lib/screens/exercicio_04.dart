import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:trabalho/screens/home.dart';

class Exercicio_04 extends StatefulWidget {
  @override
  _Exercicio_04State createState() => _Exercicio_04State();
}

class _Exercicio_04State extends State<Exercicio_04> {
  TextEditingController _conceitoController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String conceitoFinal;

  static const platform = const MethodChannel("channel");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notas da Prova"),
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
                controller: _conceitoController,
                decoration: InputDecoration(
                    labelText: "Nota do Aluno",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue[500], fontSize: 25.0),
                validator: (text) {
                  if (text.isEmpty) {
                    return "Insira uma nota";
                  }
                  if (text.contains(".") || text.contains(",")) {
                    return "Nota do aluno é invalida. Insira um valor inteiro";
                  }
                  if (text.length > 3) {
                    return "Insira um valor com no máximo 3 digitos";
                  }
                  int valor = int.parse(_conceitoController.text);
                  if (valor == null) {
                    return "Insira a nota do aluno.";
                  }
                  if (valor < 0 || valor > 100) {
                    return "Nota do aluno é invalida. Insira a nota de 0 à 100";
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
                        await _exercicio04(
                          _conceitoController.text,
                        );
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
        "${conceitoFinal.toUpperCase()}",
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
    _conceitoController.text = "";
    setState(() {
      _formkey = GlobalKey<FormState>();
    });
  }

  Future _exercicio04(conceito) async {
    try {
      final String result = await platform
          .invokeMethod("_exercicio04", {"conceito": _conceitoController.text});
      conceitoFinal = result;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
