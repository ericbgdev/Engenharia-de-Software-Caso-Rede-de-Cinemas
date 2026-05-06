import 'package:flutter/material.dart';
import '../controllers/sessao_controller.dart';
import '../models/sessao.dart';

class SessaoListPage extends StatefulWidget {
  const SessaoListPage({super.key});

  @override
  State<SessaoListPage> createState() => _SessaoListPageState();
}

class _SessaoListPageState extends State<SessaoListPage> {
  final SessaoController _controller = SessaoController();

  List<Sessao> _sessoes = [];
  bool _carregando = true;

  int _filtroSala = 0;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    setState(() => _carregando = true);

    List<Sessao> resultado;
    if (_filtroSala == 0) {
      resultado = await _controller.carregarSessoes();
    } else {
      resultado = await _controller.carregarSessoesPorSala(_filtroSala);
    }

    setState(() {
      _sessoes = resultado;
      _carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16213E),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cine São João',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'São João da Boa Vista – SP',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: _buildFiltroSalas(),
        ),
      ),
      body: _carregando
          ? const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            )
          : _sessoes.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhuma sessão encontrada.',
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _sessoes.length,
                  itemBuilder: (context, index) {
                    return _buildCardSessao(_sessoes[index]);
                  },
                ),
    );
  }

  Widget _buildFiltroSalas() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _botaoFiltro('Todas', 0),
          const SizedBox(width: 8),
          _botaoFiltro('Sala 1', 1),
          const SizedBox(width: 8),
          _botaoFiltro('Sala 2', 2),
        ],
      ),
    );
  }

  Widget _botaoFiltro(String label, int valor) {
    final selecionado = _filtroSala == valor;
    return GestureDetector(
      onTap: () {
        setState(() => _filtroSala = valor);
        _carregarDados();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: selecionado ? Colors.amber : Colors.white12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selecionado ? Colors.black : Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildCardSessao(Sessao sessao) {
    Color corGenero = sessao.generoFilme!.contains('Ação')
        ? Colors.red.shade700
        : Colors.teal.shade600;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF16213E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  sessao.horario,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Sala ${sessao.sala}',
                    style: const TextStyle(color: Colors.white54, fontSize: 11),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sessao.tituloFilme ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: corGenero,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      sessao.generoFilme ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    sessao.descricaoFilme ?? '',
                    style:
                        const TextStyle(color: Colors.white54, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '⏱ ${_controller.formatarDuracao(sessao.duracaoFilme ?? 0)}',
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
