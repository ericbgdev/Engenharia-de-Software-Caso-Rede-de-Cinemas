import '../models/sessao.dart';
import '../repositories/sessao_repository.dart';

class SessaoController {
  final SessaoRepository _repository = SessaoRepository();
  Future<List<Sessao>> carregarSessoes() async {
    return await _repository.buscarTodasSessoes();
  }
  Future<List<Sessao>> carregarSessoesPorSala(int sala) async {
    return await _repository.buscarSessoesPorSala(sala);
  }
  String formatarDuracao(int minutos) {
    final horas = minutos ~/ 60;
    final mins = minutos % 60;
    if (mins == 0) return '${horas}h';
    return '${horas}h ${mins}min';
  }
}
