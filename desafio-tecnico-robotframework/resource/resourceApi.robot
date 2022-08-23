*** Settings ***
Documentation    Documentação da API: https://reqres.in/
Library          RequestsLibrary
Library          Collections
     
*** Variables ***
${baseURL}           https://reqres.in/api/
${GET}              users
${POST}             users
${PUT}              users/${id}
${id}               1

*** Keywords *** 
###SETUP E TEARDOWNS
Conectar a API
  Create Session    regresApi   ${baseURL}

### Métodos
Relizar uma consulta na API
  ${response}                           Get Request     regresApi   ${GET}
  Should Be Equal As Strings            ${response.status_code}     200
  Log                                   ${response.text}

Relizar a criação de um usuario
  ${response}                           Post Request    regresApi   ${POST}
  ...                                   data={"name": "Teste POST", "job": "QA"}
  Should Be Equal As Strings            ${response.status_code}     201
  Log                                   ${response.text}

Relizar a consulta de um usuario existente
  ${response}                           Get Request     regresApi   users/${id}
  Should Be Equal As Strings            ${response.status_code}     200
  Log                                   ${response.text}

Deletar um usuario existente
  ${response}                           Delete Request  regresApi   users/${id}
  Should Be Equal As Strings            ${response.status_code}     204
  Log                                   ${response.text}

Atualizar um usuario existente
  ${response}                           Put Request     regresApi   ${PUT}
  ...                                   data={"name": "Teste POST Atualizado", "job": "QA"}
  Should Be Equal As Strings            ${response.status_code}     200
  Log                                   ${response.text}