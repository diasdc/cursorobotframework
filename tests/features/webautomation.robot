*** Settings ***
Documentation        Aqui estarão presentes todos os testes automatizados do módulo de Automação Web

Resource        ../../src/config/package.robot


Library        SeleniumLibrary

Test Setup    Abrir navegador

Test Teardown    Fechar navegador

*** Variables ***
&{NOVO_USUARIO}
...        nome=Thiago
...        ult_nome=Costa
...        email=thiago.teste@robot.com
...        endereço=Rua Teste teste
...        universidade=Estácio
...        profissao=Analista de Teste
...        genero=Masculino
...        idade=37


*** Test Cases ***
    
    

Cenario 2: Criar usuário com sucesso usando BDD
    [Tags]    BDD
    Dado que o cliente esteja na tela de cadastro
    E preencher todos os campos
    Quando clicar em Criar
    Então deve ser apresentada a mensagem "Usuário criado com sucesso"

#Cenario 3: Criar usuário sem informar o nome
#    [Tags]    BDD
#    Dado que o cliente esteja na tela de cadastro
#    E preencher todos os campos exceto o campo nome
#    Quando clicar em Criar
#    Então deve ser apresentada a mensagem "Usuário criado com sucesso"
Cenario: Criar usuário através da sessão de lista de 
    [Tags]    BDD_NOVO
    Dado que eu esteja na tela de lista de usuários
    E clique na opção NOVO USUÁRIO
    Quando finalizar o cadastro preenchendo todos os campos
    Então deverá ser apresentada a mensagem "Usuário criado com sucesso"
