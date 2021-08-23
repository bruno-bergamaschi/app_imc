import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String peso = '';
  String altura = '';
  var imc = 0.0;
  String msg = '';

  void calcularIMC(String peso, String altura) {
    checkText(peso, altura);
    double newPeso = double.parse(peso);
    double newAltura = double.parse(altura);

    imc = newPeso / (newAltura * newAltura);
    var imcFormatado = imc.toStringAsFixed(2);

    setState(() {
      if (imc < 18.5) {
        msg = 'Seu IMC é $imcFormatado. Você está abaixo do peso ideal.';
      } else if (imc >= 18.5 && imc < 24.9) {
        msg = 'Seu IMC é $imcFormatado. Você está no peso ideal.';
      } else if (imc >= 25 && imc < 29.9) {
        msg = 'Seu IMC é $imcFormatado. Você está com sobrepeso.';
      } else {
        msg = 'Seu IMC é $imcFormatado. Você está com obesidade.';
      }
    });
  }

  void checkText(String textPeso, String textAltura) {
    if (textPeso.length <= 0 || textAltura.length <= 0) {
      setState(() {
        msg = 'Informar os valores de Peso e Altura.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('IMC'),
          centerTitle: true,
          toolbarHeight: 70,
          leading: Image.asset('assets/logo.png')),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Peso',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.monitor_weight_outlined)),
                onChanged: (param) {
                  peso = param;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Altura',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.emoji_people)),
                onChanged: (param) {
                  altura = param;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: ElevatedButton(
                child: Text('Calcular'),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(7, 59, 76, 1)),
                onPressed: (() => calcularIMC(peso, altura)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              alignment: Alignment.center,
              child: Text(
                '$msg',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
