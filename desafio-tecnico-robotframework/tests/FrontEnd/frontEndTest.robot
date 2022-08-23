*** Settings ***
Resource         ../../resource/frontEndTestResource.robot
Test Setup       Start Session
Test Teardown    End Session

*** Test Cases *** 
Validar os campos obrigatorios do formulario com sucesso
    [Documentation]                                         Esse teste verifica se os campos para preenchimento do formulário são obrigatórios
    [Tags]                                                  TC-01
    Dado que eu esteja no site Automation Practice
    Quando informar o e-mail "testevalidarcampo9999@hotmail.com"
    E clilcar em criar uma conta
    Então validarei se os campos do formulário são de preenchimento obrigatório

Realizar um cadastro com os campos obrigatórios preenchidos com sucesso
    [Documentation]                                         Esse teste verifica se é possível realizar um cadastro com o preenchimento dos campos do formulário obrigatórios
    [Tags]                                                  TC-02
    Dado que eu esteja na tela de cadastro
    Quando preencher os campos obrigatórios
    E clicar em regitrar
    Então terei um cadastro efetuado com sucesso

   