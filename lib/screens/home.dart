import 'package:flutter/material.dart';
import 'package:trabalho/screens/exercicio_01.dart';
import 'package:trabalho/screens/exercicio_02.dart';
import 'package:trabalho/screens/exercicio_03.dart';
import 'package:trabalho/screens/exercicio_04.dart';
import 'package:trabalho/screens/exercicio_05.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Exercícios"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.0,
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
                              "1001 - Extremamente Básico",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exercicio_01()));
                        }),
                  ),
                  SizedBox(
                    height: 16,
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
                              "1009 - Salário com Bônus",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exercicio_02()));
                        }),
                  ),
                  SizedBox(
                    height: 16,
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
                              "1018 - Cédulas",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exercicio_03()));
                        }),
                  ),
                  SizedBox(
                    height: 16,
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
                              "2344 - Notas da Prova",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exercicio_04()));
                        }),
                  ),
                  SizedBox(
                    height: 16,
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
                              "3040 - A Árvore de Natal",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exercicio_05()));
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
