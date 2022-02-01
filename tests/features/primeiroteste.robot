*** Settings ***
Documentation    Aqui estarão presentes todos os testes iniciais do curso de Robot Framework Básico
Library    String

*** Variables ***
&{PESSOA}    
...        nome=Thiago    
...        sobrenome=Costa    
...        idade=37    
...        cpf=12345678911    
...        rg=1234567891    
...        carro=Etios

@{FRUTAS}
...        limão
...        abacaxi
...        maracujá
...        melancia

*** Test Cases ***
Cenario 1: Imprimir dicionário no console
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.rg}
    Log To Console    ${PESSOA.carro}

Cenario 2: Imprimir lista de frutas no console
    [Tags]        LISTA
    Log To Console    ${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}

Cenario 3: Somando usando argumentos
    [Tags]                SOMA
    Somar dois números    30    50
    Somar os números "40" e "50"

Cenario 4: Desafio da criação do e-mail
    [Tags]    EMAIL
    Criar meu e-mail    thiago    costa    37

Cenario 5: Contar de 0 a 9
    [Tags]        CONTA
    Contar de 0 a 9
    Percorrer lista de frutas
    Contar de 0 a 10

Cenario 6: Imprimindo somente o número 5 e 8
    [Tags]        IF
    Imprimindo somente o 5 e o 8

*** Keywords ***
Somar dois números
    [Arguments]        ${NUM_A}    ${NUM_B}
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     ${SOMA}
    [Return]           ${SOMA} 

Somar os números "${NUM_A}" e "${NUM_B}"
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     ${SOMA}
    [Return]           ${SOMA}

Criar meu e-mail
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
    ${EMAIL}    Catenate    SEPARATOR=_    ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
    Log To Console    ${EMAIL}
    [Return]    ${EMAIL}

Contar de 0 a 9
    FOR    ${COUNT}    IN RANGE   0    9
        Log To Console    ${COUNT}
    END

Percorrer lista de frutas
    @{FRUTAS}    Create List    Banana    Morango    Abacate    Limão
    FOR    ${fruta}    IN    @{FRUTAS}
        Log To Console    ${fruta}        
    END

Contar de 0 a 10
    FOR    ${COUNT}    IN RANGE  0    11
        Log To Console    Estou no número: ${COUNT}        
    END

Imprimindo somente o 5 e o 8
    FOR    ${COUNT}    IN RANGE  0    11
        IF    '${COUNT}'=='5'
            Log To Console    \nEstou no número: ${COUNT}
        ELSE IF    '${COUNT}'=='8'
            Log To Console    Estou no número: ${COUNT}            
        END
    END
        