class Filme {
  final int? id;
  final String titulo;
  final String genero;
  final int duracaoMinutos;
  final String descricao;
  Filme({
    this.id,
    required this.titulo,
    required this.genero,
    required this.duracaoMinutos,
    required this.descricao,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'genero': genero,
      'duracao_minutos': duracaoMinutos,
      'descricao': descricao,
    };
  }
  factory Filme.fromMap(Map<String, dynamic> map) {
    return Filme(
      id: map['id'],
      titulo: map['titulo'],
      genero: map['genero'],
      duracaoMinutos: map['duracao_minutos'],
      descricao: map['descricao'],
    );
  }
}
