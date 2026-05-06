// Model que representa uma sessão de cinema
// Inclui dados do filme (resultado do JOIN no banco)
class Sessao {
  final int? id;
  final int filmeId;
  final int sala;       // 1 ou 2
  final String horario; // Ex: "14:00"

  // Campos do filme (preenchidos via JOIN)
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

  // Para salvar no banco (só os campos da tabela sessoes)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'filme_id': filmeId,
      'sala': sala,
      'horario': horario,
    };
  }

  // Para ler do banco com JOIN (inclui dados do filme)
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
