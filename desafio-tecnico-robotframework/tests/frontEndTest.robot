*** Settings ***
Resource         ../resource/frontEndTestResource.robot  #importe dos resources do projeto
#Test Setup       Start Session  #hooks
Test Teardown    End Session   #hooks

*** Test Cases *** 
Realizar uma busca com sucesso
    [Documentation]                                         Esse teste realiza uma busca na plataforma Agi com sucesso
    [Tags]                                                  TC-01 
    Dado que eu esteja no blog do Agi
    Quando digitar uma pesquisa no campo de pesquisar
    E clicar no notão pesquisar
    Então terei a busca realizada com sucesso

Realizar uma busca de um texto inválido
    [Documentation]                                         Esse teste realiza uma busca de um elemento inválido na plataforma Agi com sucesso
    [Tags]                                                  TC-02 
    Dado que eu esteja no blog do Agi
    Quando digitar uma pesquisa inválida no campo de pesquisar
    E clicar no notão pesquisar
    Então terei a mensagem de Nenhum resultado exibida
   