# ProjetIn

O ProjetIn é uma plataforma desenvolvida para resolver problemas enfrentados por professores e alunos da Universidade Federal de Campina Grande (UFCG) no processo de seleção e participação em projetos acadêmicos. A aplicação facilita o gerenciamento de vagas e melhora a correspondência entre alunos e oportunidades de projetos, aumentando a eficiência e eficácia do processo seletivo.

## Estrutura do Projeto
O projeto está dividido em dois componentes principais:

- Frontend: Responsável pela interface gráfica. Originalmente, neste [repositório](https://github.com/ESinco/frontend.git).
- Backend: Responsável pela lógica de negócios e comunicação com o banco de dados. Originalmente, neste [repositório](https://github.com/ESinco/backend.git).

Utilizamos o formato em submódulos para facilitar o mapeamento e a execução.

# Execução

## Requisitos
- Docker: Certifique-se de ter o [Docker](https://docs.docker.com/engine/install/) e o [Docker Compose](https://docs.docker.com/compose/install/) instalados no seu sistema.

## Configuração

### Passo 1: Clone o [repositório de gerência](https://github.com/ESinco/gerencia.git)
Uma vez clonado o repositório, entre no diretório `/projetin`.

### Passo 2: Build e Inicialização do Sistema
Na raiz do projeto, onde está localizado o arquivo `docker-compose.yml`, execute o seguinte comando para construir as imagens e inicializar os containers:
```sh
docker compose up --build
```

Isso irá iniciar os seguintes serviços:

- Frontend: Acessível em http://localhost:3000
- Backend: Acessível em http://localhost:5000
- Banco de Dados

### Passo 3: Encerrar o sistema
Para parar a aplicação e remover os containers:
```sh
docker compose down
```
- Use a opção `-v` se desejar apagar o volume associado, ou seja, os dados do banco de dados.

