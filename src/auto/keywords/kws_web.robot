*** Settings ***
Documentation        Aqui estarão presentes todas as Keywords responsáveis pelo testes Web.

Resource             ../../config/package.robot


*** Keywords ***
Dado que o cliente esteja na tela de cadastro
    Open Browser            about:blank        chrome
    Go To                    https://automacaocombatista.herokuapp.com/users/new
    Maximize Browser Window
    Set Selenium Timeout    20
    Title Should Be                      Automação com Batista
    Wait Until Element Is Visible        xpath=//*[contains(text(), 'Novo Usuário!!')]

E preencher todos os campos
    Input Text    id=user_name            ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname        ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email           ${NOVO_USUARIO.email}
    Input Text    id=user_address         ${NOVO_USUARIO.endereço}
    Input Text    id=user_university      ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile         ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender          ${NOVO_USUARIO.genero}
    Input Text    id=user_age             ${NOVO_USUARIO.idade}

Quando clicar em Criar
    Click Element    xpath=//input[@value='Criar']

Então deve ser apresentada a mensagem "Usuário criado com sucesso"
    Wait Until Element Is Visible        xpath=//*[contains(text(), 'Usuário Criado com sucesso')]

    Wait Until Page Contains    ${NOVO_USUARIO.nome}
    Wait Until Page Contains    ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains    ${NOVO_USUARIO.email}
    Wait Until Page Contains    ${NOVO_USUARIO.endereço}
    Wait Until Page Contains    ${NOVO_USUARIO.universidade}
    Wait Until Page Contains    ${NOVO_USUARIO.profissao}
    Wait Until Page Contains    ${NOVO_USUARIO.genero}
    Wait Until Page Contains    ${NOVO_USUARIO.idade}

Dado que eu esteja na tela de lista de usuários
    Go To                    https://automacaocombatista.herokuapp.com/users
    Maximize Browser Window
    Set Selenium Timeout    20
    Title Should Be                      Automação com Batista
    Wait Until Element Is Visible        xpath=//*[contains(text(), 'Lista de Usuários!!')]

E clique na opção NOVO USUÁRIO
   Click Element    xpath=//*[contains(text(), 'Novo Usuário')]

Quando finalizar o cadastro preenchendo todos os campos
    Input Text    id=user_name            ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname        ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email           ${NOVO_USUARIO.email}
    Input Text    id=user_address         ${NOVO_USUARIO.endereço}
    Input Text    id=user_university      ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile         ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender          ${NOVO_USUARIO.genero}
    Input Text    id=user_age             ${NOVO_USUARIO.idade}
    Click Element    xpath=//input[@value='Criar']

Então deverá ser apresentada a mensagem "Usuário criado com sucesso"
    Wait Until Element Is Visible        xpath=//*[contains(text(), 'Usuário Criado com sucesso')]

    Wait Until Page Contains    ${NOVO_USUARIO.nome}
    Wait Until Page Contains    ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains    ${NOVO_USUARIO.email}
    Wait Until Page Contains    ${NOVO_USUARIO.endereço}
    Wait Until Page Contains    ${NOVO_USUARIO.universidade}
    Wait Until Page Contains    ${NOVO_USUARIO.profissao}
    Wait Until Page Contains    ${NOVO_USUARIO.genero}
    Wait Until Page Contains    ${NOVO_USUARIO.idade}
