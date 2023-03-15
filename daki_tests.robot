*** Settings ***
Documentation    Essa suíte testa o app Daki 
Resource         daki_resources.robot



***Test Cases***

Inicia a apk
    Open Application    http://localhost:4723/wd/hub
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Pixel_4_API_30
    ...                 app=${EXECDIR}/app/daki.apk
    ...                 udid=emulator-5554

    Verifica se a aplicação inicializou

Caso de Teste 01 - Aceitar o cupom
    [Documentation]    Esse teste verifica o cupom inicial ao abrir o app
    ...                
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

