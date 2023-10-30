import 'package:flutter/material.dart';

/* Tudo no Flutter é um Widget, um component,
cada widget é um "lego" que se encaixa um no outro
para formar as estruturas */

/* StatelessWidget - um classe componente que tem seu conteúdo estático/imutável
que significa que depois que o app for buildado, não pode ser alterado.
StatefulWidget - uma classe de componente que tem seu conteúdo dinâmico,
onde o Flutter consegue através de estados, modificar valores e assim podemos ter diversas interações */

class HomePage extends StatefulWidget {
  final String name = "william araujo";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // BuildContext context é o contexto da árvore de widgets do flutter, compartilhado entre os widgets
  @override
  Widget build(BuildContext context) {
    // Scaffold é o esqueleto que dá o alicerce pro nosso app. nossa estrutura, ele tem já estruturas comuns de um app, drawer, actions, etc
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fundamentos Flutter'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          // esse widget da pra usar tbm pra espaçamento entre widgets
          width: double.infinity, // para pegar a largura toda
          height: double.infinity, // para pegar a largura toda
          /* a coluna nao tem scroll, quando os elementos fazem
          overflow, para isso podemos enolver ela com SinkgleChildScrollView */
          /* mainAxisAlignment - para colum é o vertical, para row é o horizontal,
          crossAxisAlignment para colum é o horizontal, para row é o vertical */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                // double.infinity aqui deixa o container com largura total
                width: 80,
                height: 80,
                color: Colors.blue[700],
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.amber[700],
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.greenAccent[700],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
  Widgets que estou aprendendo:
  - Text: texto simples;
  - Container: para envolver um widget e dar margin e padding, e coisas de espaçamento;
  - SizedBox é bom para colocar espaços entre elementos;
  - Column;
  - Row;
  - Center: centraliza as coisas no centro da tela;
  - SingleChildScrollView;
  - ListView e ListView.builder
  - Expanded, para expandir o tamanho de elementos específios em rows, columns e outros widgets pai
*/
