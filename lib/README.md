# 🎬 Cine São João — Sistema de Consulta de Sessões

Trabalho de Engenharia de Software — ADS 2º Ano  
Arquitetura: **MVC + Service + Repository + SQLite**

---

## Estrutura do Projeto

```
lib/
├── models/
│   ├── filme.dart          # Entidade Filme
│   └── sessao.dart         # Entidade Sessao (com dados do filme via JOIN)
├── views/
│   ├── home_page.dart      # Tela inicial
│   └── sessao_list_page.dart  # Lista de sessões com filtro por sala
├── controllers/
│   └── sessao_controller.dart  # Regras e coordenação
├── services/
│   └── database_service.dart   # Criação e configuração do SQLite
├── repositories/
│   └── sessao_repository.dart  # Queries SQL (JOIN)
└── main.dart
```

---

## Pré-requisitos

- Flutter SDK 3.x instalado
- Emulador Android/iOS ou dispositivo físico

---

## Como rodar

```bash
# 1. Entre na pasta do projeto
cd cinema_app

# 2. Instale as dependências
flutter pub get

# 3. Rode o app
flutter run
```

---

## Banco de Dados (SQLite)

**Tabela `filmes`**
| id | titulo | genero | duracao_minutos | descricao |
|----|--------|--------|-----------------|-----------|
| 1  | Deadpool 3 | Ação/Comédia | 130 | ... |
| 2  | Divertida Mente 2 | Animação | 100 | ... |
| 3  | Meu Malvado Favorito 4 | Animação/Comédia | 95 | ... |

**Tabela `sessoes`**
| id | filme_id | sala | horario |
|----|----------|------|---------|
| 1  | 3        | 1    | 10:00   |
| 2  | 1        | 1    | 14:00   |
| 3  | 1        | 1    | 18:30   |
| 4  | 2        | 2    | 15:00   |
| 5  | 2        | 2    | 19:00   |
| 6  | 1        | 2    | 21:00   |

---

## Funcionalidades

- ✅ Consulta de todas as sessões do dia
- ✅ Filtro por Sala 1 / Sala 2
- ✅ Exibe: título, gênero, horário, sala, descrição e duração
- ✅ JOIN entre tabelas `sessoes` e `filmes`

---

## Caso de Uso Implementado

**Consultar Sessões Disponíveis**  
Espectador abre o app → clica em "Ver Sessões" → visualiza a programação completa → pode filtrar por sala.
