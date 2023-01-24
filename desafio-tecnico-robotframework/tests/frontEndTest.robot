*** Settings ***
Resource         ../resource/frontEndTestResource.robot
#Test Setup       Start Session
Test Teardown    End Session

*** Test Cases *** 
Criar um usuário com sucesso
    [Documentation]                                         Esse teste realiza a criação de um usuário na plataforma courses
    [Tags]                                                  TC-01 
    Dado que eu esteja na tela criação de usuário
    Quando preencher os campos do formulário
    E clicar em sign up
    Então terei o usuário criado com sucesso

Tentar realizar o cadastro de um usuário existente com sucesso
    [Documentation]                                         Esse teste realiza a validação da tentativa de criação de um usuário já existente em banco de dados
    [Tags]                                                  TC-02 
    Dado que eu esteja na tela criação de usuário
    Quando preencher os campos do formulário com dados já cadastrados
    Então receberei a mensagem de dados existentes

Realizar um login com sucesso
    [Documentation]                                         Esse teste realiza um login na plataforma courses
    [Tags]                                                  TC-03
    Dado que eu esteja na tela de login
    Quando informar os dados para acesso
    Então serei direcionado a tela inicial com sucesso

Validar os campos de login com sucesso
    [Documentation]                                         Esse teste realiza a validação dos campos de login obrigatório do formulário
    [Tags]                                                  TC-04
    Dado que eu esteja na tela de login
    Quando clicar em sign in sem preencher nenhum campo
    Então visualizarei a mensagem de email e senha inválidos

   