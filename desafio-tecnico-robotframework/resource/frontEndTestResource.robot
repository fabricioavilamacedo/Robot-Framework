*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary


*** Variables ***
${URL}                      http://automationpractice.com/index.php?controller=authentication
${Browser}                  chrome
${imgNewExperience}         xpath=//*[@id="header_logo"]/a/img
${campoEmailValido}         id=email_create    
${btnCreateAccount}         //*[@id="SubmitCreate"]/span/i
${campoFirstName}           id=customer_firstname
${campoLastName}            id=customer_lastname
${campoEmail}               id=email
${campoPassword}            id=passwd
${campoObrigatorioX}        xpath=//*[@id="account-creation_form"]/div[1]/div[2]
${campoAdress}              id=address1
${stringAdress}             Casa
${campoCity}                id=city
${campoZipCode}             id=postcode
${campoMobilePhone}         id=phone_mobile
${campoReference}           id=alias
${campoState}               id=id_state
${selecaoState}             xpath=//*[@id="id_state"]/option[2]
${campoCountry}             id=id_country
${selecaoCountry}           id=uniform-id_country
${btnRegister}              id=submitAccount
${msgPage}                  xpath=//*[@id="center_column"]/h1
${intMobilePhone}                        11954458877                           #Numero adicionado pois faker estava gerando números inconsistentes

*** Keywords ***

#TC-01   Validar os campos obrigatorios do formulario com sucesso
Start Session
  Open Browser          url=${URL}  browser=${Browser}
  Set Window Size                      1600    1900
  Maximize Browser Window	  

End Session
  Capture Page Screenshot
  Close Browser

Dado que eu esteja no site Automation Practice
  Wait Until Element Is Visible            locator=${imgNewExperience}
  Page Should Contain Element              ${imgNewExperience}

Quando informar o e-mail "${emailValido}"
  Wait Until Element Is Visible            locator=${campoEmailValido}
  Input Text                               ${campoEmailValido}  ${emailValido}

E clilcar em criar uma conta
  Click Element                           ${btnCreateAccount}

Então validarei se os campos do formulário são de preenchimento obrigatório
  Wait Until Element Is Visible            locator=${campoFirstName}
  Click Element                            ${campoFirstName}
  Page Should Contain Element              ${campoObrigatorioX}
  Click Element                            ${campoLastName}
  Page Should Contain Element              ${campoObrigatorioX}
  Click Element                            ${campoPassword} 
  Page Should Contain Element              ${campoObrigatorioX}
 
#TC-02   Realizar um cadastro com os campos obrigatórios preenchidos com sucesso
Dado que eu esteja na tela de cadastro
  ${emailValidoFaker}                      FakerLibrary.Email
  Wait Until Element Is Visible            locator=${campoEmailValido}
  Input Text                               ${campoEmailValido}        ${emailValidoFaker}
  Click Element                            ${btnCreateAccount}

Quando preencher os campos obrigatórios
  ${stringName}                            FakerLibrary.Name
  ${stringLastName}                        FakerLibrary.LastName
  ${stringSenha}                           FakerLibrary.Password
  ${emailValido2}                          FakerLibrary.Email
  ${stringCity}                            FakerLibrary.City
  ${intZipCode}                            FakerLibrary.Zipcode
  Sleep                                    10                                    #Coloquei essa pausa por conta de instalibidade no site
  Wait Until Element Is Visible            locator=${campoFirstName}
  Input Text                               ${campoFirstName}          ${stringName}
  Input Text                               ${campoLastName}           ${stringLastName}
  Input Text                               ${campoPassword}           ${stringSenha}
  Input Text                               ${campoAdress}             ${stringAdress}
  Input Text                               ${campoCity}               ${stringCity}
  Click Element                            ${campoState}   
  Wait Until Element Is Visible            locator=${selecaoState}   
  Click Element                            ${selecaoState}   
  Input Text                               ${campoZipCode}            ${intZipCode} 
  Click Element                            ${campoCountry}
  Wait Until Element Is Visible            locator=${selecaoCountry}
  Click Element                            ${selecaoCountry}
  Input Text                               ${campoMobilePhone}        ${intMobilePhone} 

E clicar em regitrar
  Click Element                            ${btnRegister}

Então terei um cadastro efetuado com sucesso
  Wait Until Element Is Visible            locator=${msgPage}
  Page Should Contain Element              ${msgPage}