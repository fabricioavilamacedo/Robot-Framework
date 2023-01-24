*** Settings ***
Library     SeleniumLibrary  #import da lib
Library     FakerLibrary     #import da lib

# Variáveis utilizadas 
*** Variables ***
${URLCREATE}                     https://courses.ultimateqa.com/users/sign_up
${URLSIGN}                       https://courses.ultimateqa.com/users/sign_in
${Browser}                       chrome
${campoFirstName}                id=user[first_name]
${campoLastName}                 id=user[last_name]   
${campoEmail}                    id=user[email]
${campoPassword}                 id=user[password]
${email}                         teste12345@hotmail.com
${password}                      @Teste123
${checkTermos}                   id=user[terms]
${btnSignup}                     css=button.button.button-primary.g-recaptcha
${logoQa}                        xpath=/html/body/header/div[2]/div/section/a/img
${stringProdutos}                xpath=//*[@id="main-content"]/div/h2
${msgEmail}                      xpath=//*[@id="notice"]/ul/li[2]
${msgPage}                       xpath=//*[@id="main-content"]/div/h2
${msgLogin}                      xpath=//*[@id="notifications"]/div/div/div/p

*** Keywords ***

# Executa essa keyword após a finalização de cada teste
End Session
  Capture Page Screenshot
  Close Browser

#TC-01   Criar um usuário com sucesso
Dado que eu esteja na tela criação de usuário
  Open Browser                             url=${URLCREATE}  browser=${Browser}
  Set Window Size                          1600    1900
  Maximize Browser Window	  
  Wait Until Element Is Visible            locator=${logoQa}
  Page Should Contain Element              ${logoQa}

Quando preencher os campos do formulário
  ${firstName}                             FakerLibrary.firstName
  ${lastName}                              FakerLibrary.lastName
  Wait Until Element Is Visible            locator=${campoFirstName}
  Input Text                               ${campoFirstName}  ${firstName}
  Input Text                               ${campoLastName}   ${lastName}
  Input Text                               ${campoEmail}      ${email}
  Input Text                               ${campoPassword}   ${password}
  
E clicar em sign up
  Click Element                           ${checkTermos}
  Click Element                           ${btnSignup}

Então terei o usuário criado com sucesso
  Wait Until Element Is Visible            locator=${stringProdutos}
  Page Should Contain Element              ${stringProdutos}


#TC-02   Validar os campos do formulário com sucesso
Quando preencher os campos do formulário com dados já cadastrados
  ${firstName}                             FakerLibrary.firstName
  ${lastName}                              FakerLibrary.lastName
  Wait Until Element Is Visible            locator=${campoFirstName}
  Input Text                               ${campoFirstName}  ${firstName}
  Input Text                               ${campoLastName}   ${lastName}
  Input Text                               ${campoEmail}      ${email}
  Input Text                               ${campoPassword}   ${password}
  Click Element                           ${btnSignup}

Então receberei a mensagem de dados existentes
  Wait Until Element Is Visible            locator=${msgEmail}
  Page Should Contain Element              ${msgEmail}


#TC-03   Realizar um login com sucesso
Dado que eu esteja na tela de login
  Open Browser                             url=${URLSIGN}            browser=${Browser}
  Set Window Size                          1600    1900
  Maximize Browser Window	  

Quando informar os dados para acesso
  Input Text                               ${campoEmail}             ${email}
  Input Text                               ${campoPassword}          ${password}

Então serei direcionado a tela inicial com sucesso
  Click Element                           ${btnSignup}
  Wait Until Element Is Visible            locator=${msgPage}
  Page Should Contain Element              ${msgPage}


#TC-04   Validar os campos de login com sucesso
Quando clicar em sign in sem preencher nenhum campo
  Click Element                           ${btnSignup}

Então visualizarei a mensagem de email e senha inválidos
  Wait Until Element Is Visible            locator=${msgLogin}
  Page Should Contain Element              ${msgLogin}