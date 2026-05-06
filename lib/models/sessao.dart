class Sessao {
  final int? id;
  final int filmeId;
  final int sala;
  final String horario;
  final String? tituloFilme;
  final String? generoFilme;
  final String? descricaoFilme;
  final int? duracaoFilme;
  Sessao({
    this.id,
    required this.filmeId,
    required this.sala,
    required this.horario,
    this.tituloFilme,
    this.generoFilme,
    this.descricaoFilme,
    this.duracaoFilme,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'filme_id': filmeId,
      'sala': sala,
      'horario': horario,
    };
  }
  factory Sessao.fromMap(Map<String, dynamic> map) {
    return Sessao(
      id: map['id'],
      filmeId: map['filme_id'],
      sala: map['sala'],
      horario: map['horario'],
      tituloFilme: map['titulo'],
      generoFilme: map['genero'],
      descricaoFilme: map['descricao'],
      duracaoFilme: map['duracao_minutos'],
    );
  }
}
