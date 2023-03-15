*** Settings ***
Documentation    Essa suíte testa o app Daki 
Resource         daki_resources.robot


***Test Cases***

Inicializa a APK:
    
    Inicia a apk
    Verifica se a aplicação inicializou

Caso de Teste 01 - Aceitar o cupom
    [Documentation]    Esse teste verifica o cupom inicial ao abrir o app              
    [Tags]             cupom  inicializacao

    Avança nas telas inciais: "PRODUTOS EM FALTA?" e "EXPERIMENTE JÁ!" 
    Verifica se esta na tela de endereço   

Caso de Teste 02 - Inserindo endereço
    [Documentation]    Deve buscar um ederedeço 
    [Tags]             gps endereço
    
    Digita um endereço
    Seleciona o endereço  
    Informa que não tem complemento
    Salva o endereço
    Confirma que o endereço esta presente na tela inicial  

Caso de Teste 03 - Realiza login
    [Documentation]    Deve acessar o card do cupom DAKI50 e verificar se o mesmo esta na tela
    [Tags]             cupom DAKI50

    Tap no card DAKI50
    Confirma se o texto "Cupom: DAKI50" esta tela  
   
 

