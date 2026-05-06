import '../models/sessao.dart';
import '../repositories/sessao_repository.dart';

// Controller: faz a ponte entre a View e o Repository
// Aqui ficaria regra de negócio (ex: validações, filtros)
class SessaoController {
  final SessaoRepository _repository = SessaoRepository();

  // Retorna todas as sessões disponíveis
  Future<List<Sessao>> carregarSessoes() async {
    return await _repository.buscarTodasSessoes();
  }

  // Retorna sessões de uma sala específica
  Future<List<Sessao>> carregarSessoesPorSala(int sala) async {
    return await _repository.buscarSessoesPorSala(sala);
  }

  // Formata a duração de minutos para "Xh Ym"
  String formatarDuracao(int minutos) {
    final horas = minutos ~/ 60;
    final mins = minutos % 60;
    if (mins == 0) return '${horas}h';
    return '${horas}h ${mins}min';
  }
}
