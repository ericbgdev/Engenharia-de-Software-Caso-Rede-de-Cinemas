import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Serviço responsável por criar, configurar e popular o banco de dados SQLite
class DatabaseService {
  static Database? _database;

  // Singleton: retorna a mesma instância do banco para todo o app
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Caminho onde o SQLite vai salvar o arquivo
    String caminho = join(await getDatabasesPath(), 'cinema.db');

    return await openDatabase(
      caminho,
      version: 1,
      onCreate: _criarTabelas,
    );
  }

  // Cria as tabelas e insere os dados iniciais
  Future<void> _criarTabelas(Database db, int version) async {
    // Tabela de filmes
    await db.execute('''
      CREATE TABLE filmes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        genero TEXT NOT NULL,
        duracao_minutos INTEGER NOT NULL,
        descricao TEXT NOT NULL
      )
    ''');

    // Tabela de sessões (FK para filmes)
    await db.execute('''
      CREATE TABLE sessoes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        filme_id INTEGER NOT NULL,
        sala INTEGER NOT NULL,
        horario TEXT NOT NULL,
        FOREIGN KEY (filme_id) REFERENCES filmes(id)
      )
    ''');

    // Popular com dados iniciais
    await _inserirDadosIniciais(db);
  }

  Future<void> _inserirDadosIniciais(Database db) async {
    // Inserir os 3 filmes
    await db.rawInsert('''
      INSERT INTO filmes (titulo, genero, duracao_minutos, descricao)
      VALUES ('Deadpool 3', 'Ação/Comédia', 130,
        'Wade Wilson e Wolverine se unem em uma missão improvávelcom muito humor e ação frenética.')
    ''');

    await db.rawInsert('''
      INSERT INTO filmes (titulo, genero, duracao_minutos, descricao)
      VALUES ('Divertida Mente 2', 'Animação', 100,
        'Riley enfrenta a adolescência com novas emoções surgindo em sua mente — ansiedade, inveja e muito mais.')
    ''');

    await db.rawInsert('''
      INSERT INTO filmes (titulo, genero, duracao_minutos, descricao)
      VALUES ('Meu Malvado Favorito 4', 'Animação/Comédia', 95,
        'Gru enfrenta um novo vilão enquanto tenta equilibrar a vida de pai de família com o universo do crime.')
    ''');

    // Inserir as sessões
    // Sala 1
    await db.rawInsert("INSERT INTO sessoes (filme_id, sala, horario) VALUES (3, 1, '10:00')"); // Malvado Favorito 4
    await db.rawInsert("INSERT INTO sessoes (filme_id, sala, horario) VALUES (1, 1, '14:00')"); // Deadpool 3
    await db.rawInsert("INSERT INTO sessoes (filme_id, sala, horario) VALUES (1, 1, '18:30')"); // Deadpool 3

    // Sala 2
    await db.rawInsert("INSERT INTO sessoes (filme_id, sala, horario) VALUES (2, 2, '15:00')"); // Divertida Mente 2
    await db.rawInsert("INSERT INTO sessoes (filme_id, sala, horario) VALUES (2, 2, '19:00')"); // Divertida Mente 2
    await db.rawInsert("INSERT INTO sessoes (filme_id, sala, horario) VALUES (1, 2, '21:00')"); // Deadpool 3
  }
}
