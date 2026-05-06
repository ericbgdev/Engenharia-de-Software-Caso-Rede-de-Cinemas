import '../models/sessao.dart';
import '../services/database_service.dart';
class SessaoRepository {
  final DatabaseService _dbService = DatabaseService();
  Future<List<Sessao>> buscarTodasSessoes() async {
    final db = await _dbService.database;
    final resultado = await db.rawQuery('''
      SELECT 
        sessoes.id,
        sessoes.filme_id,
        sessoes.sala,
        sessoes.horario,
        filmes.titulo,
        filmes.genero,
        filmes.descricao,
        filmes.duracao_minutos
      FROM sessoes
      INNER JOIN filmes ON sessoes.filme_id = filmes.id
      ORDER BY sessoes.sala, sessoes.horario
    ''');
    return resultado.map((linha) => Sessao.fromMap(linha)).toList();
  }
  Future<List<Sessao>> buscarSessoesPorSala(int sala) async {
    final db = await _dbService.database;
    final resultado = await db.rawQuery('''
      SELECT 
        sessoes.id,
        sessoes.filme_id,
        sessoes.sala,
        sessoes.horario,
        filmes.titulo,
        filmes.genero,
        filmes.descricao,
        filmes.duracao_minutos
      FROM sessoes
      INNER JOIN filmes ON sessoes.filme_id = filmes.id
      WHERE sessoes.sala = ?
      ORDER BY sessoes.horario
    ''', [sala]);
    return resultado.map((linha) => Sessao.fromMap(linha)).toList();
  }
}
