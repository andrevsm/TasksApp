import 'package:flutter/material.dart';
import 'tarefa.dart';

main() {
  runApp(new ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ListaScreen()
    );
  }
}

class ListaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller = new TextEditingController();

  void adicionaTarefa(String nomeDaTarefa) {
    setState(() {
      tarefas.add(Tarefa(nomeDaTarefa));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return new Row(
              children: [
                IconButton(
                  icon: new Icon(tarefa.concluido ? Icons.check_box : Icons.check_box_outline_blank), 
                  iconSize: 42.0,
                  color: tarefa.concluido ? Colors.green : Colors.grey,
                  onPressed: () { 
                    setState(() {
                      tarefa.concluido ? tarefa.concluido = false : tarefa.concluido = true; 
                    });
                  },
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(tarefa.nome, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Text("Adicionado em " + tarefa.data.day.toString() + "/" + tarefa.data.month.toString(),
                    style: TextStyle(fontSize: 14.0)
                    )],
                )
              ],
            );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Lista de Tarefas")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                onSubmitted: adicionaTarefa,
                decoration: InputDecoration(
                  hintText: 'Escreva o nome da tarefa'
                ),
              ), 
            ),
            Expanded(
              child: ListView.builder (
                itemCount: tarefas.length,
                itemBuilder: (_, indice) {
                  return getItem(tarefas[indice]);
                },
              )
            )
          ],
        )
      );
  }

}