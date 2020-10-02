package br.com.eduardo.trabalho;

import io.flutter.embedding.android.FlutterActivity;

import android.util.Log;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "channel";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    switch (call.method) {
                        case "_exercicio01":
                            int valor1 = Integer.parseInt(call.argument("valor1"));
                            int valor2 = Integer.parseInt(call.argument("valor2"));

                            int valor = (valor1 + valor2);
                            result.success(valor);
                            break;
                        case "_exercicio02":
                            String nome = call.argument("nome");
                            double salario = call.argument("salario");
                            double venda = call.argument("venda");

                            double comissao = venda * 0.15;
                            double total = salario + comissao;
                            result.success(total);
                            break;
                        case "_exercicio03":

                            int nota = Integer.parseInt(call.argument("nota"));
                                    
                            List<Integer> notas = new ArrayList<Integer>();

                            notas.add(nota / 100);
                            nota = nota % 100; 
                            notas.add(nota / 50);
                            nota = nota % 50;
                            notas.add(nota / 20);
                            nota = nota % 20;
                            notas.add(nota / 10);
                            nota = nota % 10;
                            notas.add(nota / 5);
                            nota = nota % 5;
                            notas.add(nota / 2);
                            nota = nota % 2;
                            notas.add(nota / 1);

                            result.success(notas);

                            break;
                        case "_exercicio04":
                            Integer conceito = Integer.parseInt(call.argument("conceito").toString());

                            String conceitoFinal = "";

                            if (conceito == 0) {
                                conceitoFinal = "E";
                            }
                            if (conceito >= 1 && conceito <= 35) {
                                conceitoFinal = "D";
                            }
                            if (conceito >= 36 && conceito <= 60) {
                                conceitoFinal = "C";
                            }
                            if (conceito >= 61 && conceito <= 85) {
                                conceitoFinal = "B";
                            }
                            if (conceito >= 86 && conceito <= 100) {
                                conceitoFinal = "A";
                            }
                            result.success(conceitoFinal);

                            break;
                        case "_exercicio05":

                        //    int quantidade, altura, espessura,galhos = 0;
        
                        //     quantidade = Integer.parseInt(in.readLine());
                        
                        //     for (int i = 0; i < quantidade; i++) {
                            
                        //     String[] tamanhos = in.readLine().split(" ");
                            
                        //     altura = Integer.parseInt(tamanhos[0]);
                        //     espessura = Integer.parseInt(tamanhos[1]);
                        //     galhos = Integer.parseInt(tamanhos[2]);
                            
                        //     if (altura >= 200 && altura <= 300 && espessura >= 50 && galhos >= 150) {
                
                        //         System.out.println("Sim");
                
                        //     } else {
                        //         System.out.println("Nao");
                        //     }
                            
                        //     result.success();

                            break;
                        default:
                            result.notImplemented();

                    }
                });

    }

}
