*** Settings ***
Documentation    Documentação da API: https://reqres.in/
Resource         ../../resource/resourceApi.robot
Suite Setup      Conectar a API

*** Test Cases *** 
Deve realizar uma consulta com sucesso
    [Documentation]                                         Esse teste visa realizar uma consulta em servidor
    [Tags]                                                  TC-01
    Relizar uma consulta na API

Deve criar um usuario com sucesso
    [Documentation]                                         Esse teste visa realizar um cadastro de um usuário em servidor
    [Tags]                                                  TC-02
    Relizar a criação de um usuario

Deve consultar um usuario existente
    [Documentation]                                         Esse teste visa realizar uma consulta em servidor de um usuário existente
    [Tags]                                                  TC-03
    Relizar a consulta de um usuario existente

Deve deletar um usuario existente
    [Documentation]                                         Esse teste visa deletar em servidor um usuário existente
    [Tags]                                                  TC-04
    Deletar um usuario existente

Deve atualizar os dados de um usuario existente
    [Documentation]                                         Esse teste visa atualizar em servidor os dados de um usuário existente
    [Tags]                                                  TC-05
    Atualizar um usuario existente