# Desafio Tecnico - Frontend e API - BANCO ABC

## Descrição
Desafio Técnico utilizando Robot Framework incluindo automação Frontend e de API

## Instruções
1. Baixe e instale o Python: [https://www.python.org/downloads/]

2. Clone o repositório: `git clone git@github.com:fabricioavilamacedo/Robot-Framework.git` (SSH) or `git clone https://github.com/fabricioavilamacedo/Robot-Framework.git` (HTTPS) no editor ou IDE de sua preferência

3. No diretório raiz do projeto rode os comandos `pip install robotframework`, `pip install --upgrade robotframework-seleniumlibrary`, `pip install robotframework-faker` e `pip install robotframework-requests`para instalação do framework e suas respectivas libraries

4. Na pasta 'FrontEnd' já contém o arquivo chromedriver para execução dos testes no navegador Chrome, caso ocorra algum erro na execução dos testes frontend, confira se a versão do arquivo é compatível com a versão de seu navegador Chrome.

5. Para execução dos testes, nas respectivas pastas do mesmo, rode os comandos abaixo:

-> robot -d Results .\frontEndTest.robot   : Para execução de todos os cenários de testes frontend
-> robot -d Results -i [TAG] .\frontEndTest.robot  : Para execução de uma TAG específica de frontend

-> robot -d Results .\ApiTest.robot        : Para execução de todos os cenários de testes de API
-> robot -d Results -i [TAG] .\ApiTest.robot  : Para execução de uma TAG específica de API

## Estrutura de diretórios
```
/
├─ desafio-tecnico-robotframework/          # Raiz do projeto onde se encontram os demais diretórios e testes
├─ ├─resource/                              # Diretório onde ficam os arquivos de resource do robotframework
├─ ├─test/                                  # Scripts de testes API e Frontend
├─────────├─API/                            # Scripts de testes de API
├──────────────├─Results/                   # Diretório onde ficam armazenados as evidências e log de execução dos testes
├─────────├─FrontEnd/                       # Scripts de testes de Frotend
├──────────────├─Results/                   # Diretório onde ficam armazenados as evidências e log de execução dos testes
└─ README.md                                # Esse arquivo
```
