*** Settings ***
Library     AppiumLibrary


*** Variables ***
${USAR_AGORA}              accessibility_id=Usar agora
${PROXIMO}                  accessibility_id=Próximo
${PULAR}                    accessibility_id=Pular
${INPUT_ENDERECO}      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]
${ENDERECO}        Rua Augusta, 500 - Consolação
${CONFIRMA_ENDERECO}         accessibility_id=Rua Augusta, 500 - Consolação, São Paulo - State of São Paulo, Brazil
${BOTA_SALVAR_ENDERECO}  accessibility_id=Salvar endereço
${CHECKBOX_ENDERECO}               xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.CheckBox



*** Keywords ***

Inicia a apk
    Open Application    http://localhost:4723/wd/hub
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Pixel_4_API_30
    ...                 app=${EXECDIR}/app/daki.apk
    ...                 udid=emulator-5554

Verifica se a aplicação inicializou
    Wait Until Element Is Visible   ${USAR_AGORA}        10

Fechar o app
    Close Application

Captura um print    
    Capture Page Screenshot


Avança nas telas inciais: "${CARD1}" e "${CARD2}" 
    Click Element    ${USAR_AGORA}  
    Click Element    ${PROXIMO} 
    Wait Until Page Contains    ${CARD1}    10
    Click Element    ${PROXIMO} 
    Wait Until Page Contains    ${CARD2}   10
    Click Element    ${PULAR}  
Verifica se esta na tela de endereço   
    Wait Until Page Contains    Onde será a entrega?    10


Digita um endereço 
    Input Text    ${INPUT_ENDERECO}    
    ...           Rua Augusta 500
    Wait Until Page Contains    ${ENDERECO}
Seleciona o endereço    
    Tap    ${CONFIRMA_ENDERECO} 
    Wait Until Element Is Visible   ${BOTA_SALVAR_ENDERECO}      10
Informa que não tem complemento
    Tap    ${CHECKBOX_ENDERECO} 
    Wait Until Element Is Visible   ${BOTA_SALVAR_ENDERECO}      10
Salva o endereço
    Click Element    ${BOTA_SALVAR_ENDERECO}
Confirma que o endereço esta presente na tela inicial   
   Wait Until Element Is Visible    accessibility_id=Rua Augusta, 500    10

Clica no endereço
    Click Element    ${CONFIRMA_ENDERECO}
