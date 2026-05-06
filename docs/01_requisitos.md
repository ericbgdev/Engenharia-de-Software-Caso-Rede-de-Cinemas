# Levantamento de Requisitos e Regras de Negócio
**Projeto:** Cine São João — Sistema de Consulta de Sessões  
**Aluno:** Eric Butzloff Gudera — RA: 25001129  
**Curso:** ADS 2º Ano — Engenharia de Software

---

## Requisitos Funcionais

| ID  | Descrição |
|-----|-----------|
| RF01 | O espectador deve poder consultar todas as sessões disponíveis do dia |
| RF02 | O espectador deve poder filtrar sessões por sala (Sala 1 ou Sala 2) |
| RF03 | Cada sessão deve exibir: título do filme, gênero, horário, sala e descrição |
| RF04 | O sistema deve exibir a duração formatada de cada filme |
| RF05 | O administrador deve poder cadastrar filmes no banco de dados |
| RF06 | O administrador deve poder cadastrar sessões vinculadas a filmes e salas |

---

## Regras de Negócio

| ID  | Descrição |
|-----|-----------|
| RN01 | O cinema possui exatamente 2 salas |
| RN02 | Cada sessão pertence a uma única sala e exibe um único filme |
| RN03 | Não podem existir duas sessões na mesma sala no mesmo horário |
| RN04 | Todo filme deve ter título, gênero, duração em minutos e descrição |
| RN05 | O horário da sessão é armazenado no formato HH:MM |
| RN06 | A duração do filme deve ser maior que zero |

---

## Escopo Implementado

O caso de uso implementado neste trabalho é o **RF01 e RF02**: consulta de sessões com filtro por sala, usando arquitetura MVC + Service + Repository com persistência em SQLite.
