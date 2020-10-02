import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:trabalho/screens/home.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Exercicio_02 extends StatefulWidget {
  @override
  _Exercicio_02State createState() => _Exercicio_02State();
}

class _Exercicio_02State extends State<Exercicio_02> {
  TextEditingController _nomeController = TextEditingController();
  MoneyMaskedTextController _salarioController =
      MoneyMaskedTextController(decimalSeparator: ".", thousandSeparator: ",");
  MoneyMaskedTextController _vendaController =
      MoneyMaskedTextController(decimalSeparator: ".", thousandSeparator: ",");

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  double total;

  static const platform = const MethodChannel("channel");

  var controller = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salário com Bônus"),
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
                keyboardType: TextInputType.text,
                controller: _nomeController,
                decoration: InputDecoration(
                    labelText: "Nome",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue[500], fontSize: 25.0),
                validator: (text) {
                  if (text.isEmpty) {
                    return "Insira seu nome";
                  }
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _salarioController,
                decoration: InputDecoration(
                    labelText: "Salário",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue[500], fontSize: 25.0),
                validator: (text) {
                  if (text.isEmpty) {
                    return "Insira o valor do seu salário";
                  }
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _vendaController,
                decoration: InputDecoration(
                    labelText: "Venda",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue[500], fontSize: 25.0),
                validator: (text) {
                  if (text.isEmpty) {
                    return "Insira o valor total das vendas";
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
                        await _exercicio02(
                            _nomeController.text,
                            _salarioController.numberValue,
                            _vendaController.numberValue);
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
    AlertDialog alert = AlertDialog(
      title: Text("Exemplo de Saída"),
      content: Text(
        "TOTAL = R\$ ${total.toStringAsFixed(2)}",
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
    showDialog(context: context, child: alert);
  }

  @override
  void initState() {
    super.initState();
    _salarioController.text = "";
    _vendaController.text = "";
  }

  void _resetFields() {
    _nomeController.text = "";
    _salarioController.text = "";
    _vendaController.text = "";
    setState(() {
      _formkey = GlobalKey<FormState>();
    });
  }

  Future _exercicio02(nome, salario, venda) async {
    try {
      final double result = await platform.invokeMethod("_exercicio02", {
        "nome": _nomeController.text,
        "salario": _salarioController.numberValue,
        "venda": _vendaController.numberValue,
      });
      total = result;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
