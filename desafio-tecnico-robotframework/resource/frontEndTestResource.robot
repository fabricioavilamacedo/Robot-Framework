*** Settings ***
Library     SeleniumLibrary  #import da lib
Library     FakerLibrary     #import da lib

# Variáveis utilizadas 
*** Variables ***
${URL}                           https://blogdoagi.com.br/
${Browser}                       chrome
${campoLupa}                     id=search-open
${campoPesquisar}                xpath=/html/body/header/div[1]/div[2]/form/label/input
${btnPesquisar}                  xpath=/html/body/header/div[1]/div[2]/form/input
${textoPesquisar}                Agi
${textoPesquisarInvalido}        teste99
${msgResultado}                  xpath=/html/body/div[2]/div/div/header/h1
${msgResultadoInvalido}          xpath=/html/body/div[2]/div/div/section/header/h1

*** Keywords ***

# Executa essa keyword após a finalização de cada teste
End Session
  Capture Page Screenshot
  #Close Browser

#TC-01   Realizar uma busca com sucesso
Dado que eu esteja no blog do Agi
  Open Browser                             url=${URL}  browser=${Browser}
  Set Window Size                          1600    1900
  Maximize Browser Window	  
  
Quando digitar uma pesquisa no campo de pesquisar
  Click Element                            ${campoLupa}
  Input Text                               ${campoPesquisar}   ${textoPesquisar}

E clicar no notão pesquisar
  Click Element                           ${btnPesquisar}


Então terei a busca realizada com sucesso
  Wait Until Element Is Visible            locator=${msgResultado}
  Page Should Contain Element              ${msgResultado}


#TC-02   Realizar uma busca de um texto inválido
Quando digitar uma pesquisa inválida no campo de pesquisar
  Click Element                            ${campoLupa}
  Input Text                               ${campoPesquisar}   ${textoPesquisarInvalido}

Então terei a mensagem de Nenhum resultado exibida
  Wait Until Element Is Visible            locator=$${msgResultadoInvalido}
  Page Should Contain Element              ${msgResultadoInvalido}