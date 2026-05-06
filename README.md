
![README](readme1.svg)

## Documentação

### Casos de Uso
![Casos de Uso](docs/1.png)

### Classes do Domínio
![Classes](docs/2.png)

### Diagrama de Atividade
![Atividade](docs/3.png)

### Diagrama de Sequência
![Sequência](docs/4.png)


Quando o app abre, o main.dart chama a HomePage. Ao clicar em "Ver Sessões", a SessaoListPage pede os dados pro SessaoController, que repassa pro SessaoRepository. O Repository faz um SELECT com JOIN no banco e devolve a lista. O DatabaseService cria o banco na primeira vez que o app roda e já insere os filmes e sessões. Os models Filme e Sessao são só classes para carregar os dados entre as camadas. Veja a lógica:

![README](readme.svg)
