class Tarefa {
  
  //Atributos
  String nome;
  DateTime data;
  bool concluido;

  //Construtor
  Tarefa(String nome) {
    this.nome = nome;
    data = DateTime.now();
    concluido = false;
  }
}