import '../models/sessao.dart';
import '../services/database_service.dart';

// Repository: responsável por acessar os dados do banco
// Fica entre o Service e o banco SQLite
class SessaoRepository {
  final DatabaseService _dbService = DatabaseService();

  // Busca todas as sessões com dados do filme via JOIN
  Future<List<Sessao>> buscarTodasSessoes() async {
    final db = await _dbService.database;

    // JOIN entre sessoes e filmes para pegar titulo, genero e descricao
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

    // Converte cada linha do resultado em um objeto Sessao
    return resultado.map((linha) => Sessao.fromMap(linha)).toList();
  }

  // Busca sessões filtradas por sala específica
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
