*** Settings ***
Library  SeleniumLibrary 

*** Variables ***
${URL}                   https://ericsson-dev.sydle.one/
${BROWSER}               chrome
${LOGIN}                 name=login
${PASSWORD}              name=password

*** Keywords ***

## Caso de Teste 01: Logar no ambiente da Sydle

Abrir Sessao
  Open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window

Dado que eu efetue o login
  Wait Until Element Is Visible  ${LOGIN}
  Input Text    ${LOGIN}  rpa.sydle
  Input Text    ${PASSWORD}  123456

Quando eu logar no ambiente da Sydle
  Click Button  xpath=/html/body/sy-root/div/sy-login/div[1]/div/div/form/button

Então eu devo verificar se a página Home foi exibida
  Wait Until Element Is Visible  css=#sy-header > div > div.sy-title-column.col.s4.truncate > div > span
  Title Should Be  SYDLE ONE


## Caso de Teste 02: Entrar em Explorer no menu sidebar

Dado que eu esteje na página Home da Sydle
  Wait Until Element Is Visible  css=#sy-header > div > div.sy-title-column.col.s4.truncate > span > button

Quando eu clicar no botão para exibir o sidebar 
  Sleep  3s
  Click Button  css=#sy-header > div > div.sy-title-column.col.s4.truncate > span > button

Então eu devo clicar em Explorer
  Wait Until Element Is Visible  css=#workspace-list > ul > li:nth-child(8) > a > span
  Click Element  css=#workspace-list > ul > li:nth-child(8) > a > span

## Caso de Teste 03: Pesquisar e clicar no produto 

Dado que eu clique no + para Pesquisar
  Sleep  5s
  Wait Until Element Is Visible  css=#sy-header > div > div.sy-button-column.col.s8 > div > button.ti-plus.btn-flat.header-add-object-button.ng-star-inserted
  Click Element  css=#sy-header > div > div.sy-button-column.col.s8 > div > button.ti-plus.btn-flat.header-add-object-button.ng-star-inserted

Quando eu clicar na categoria todos e digitar "${OBJETO_PESQUISADO}" na barra de pesquisa
  Wait Until Element Is Visible  css=#sy-header > div > div.sy-button-column.col.s8 > sy-creation-menu > div > div > p-tabview > div > ul > li:nth-child(2) > a > span
  Click Element  css=#sy-header > div > div.sy-button-column.col.s8 > sy-creation-menu > div > div > p-tabview > div > ul > li:nth-child(2) > a > span 
  Sleep  3s
  Input Text  css=#sy-header > div > div.sy-button-column.col.s8 > sy-creation-menu > div > div > p-tabview > div > div > p-tabpanel:nth-child(2) > div > div > div.search-box > input
  ...  ${OBJETO_PESQUISADO}

Então eu devo clicar no botão de pesquisar e clicar no Objeto
  Wait Until Element Is Visible  css=#sy-header > div > div.sy-button-column.col.s8 > sy-creation-menu > div > div > p-tabview > div > div > p-tabpanel:nth-child(2) > div > div > div.search-box > span
  Click Element                  css=#sy-header > div > div.sy-button-column.col.s8 > sy-creation-menu > div > div > p-tabview > div > div > p-tabpanel:nth-child(2) > div > div > div.search-box > span
  Wait Until Element Is Visible  css=#sy-header > div > div.sy-button-column.col.s8 > sy-creation-menu > div > div > p-tabview > div > div > p-tabpanel:nth-child(2) > div > div > div.menu-container.all-container > a:nth-child(1) > span.class-name
  Click Element                  css=#sy-header > div > div.sy-button-column.col.s8 > sy-creation-menu > div > div > p-tabview > div > div > p-tabpanel:nth-child(2) > div > div > div.menu-container.all-container > a:nth-child(1) > span.class-name
  Sleep  5s

## Caso de Teste 04: Preencher e concluir a obra
Dado que eu clique nos campos da obra
  Select Frame  xpath=//iframe[@slotid='5a27e943642bd12b6de3239d']
  Wait Until Element Is Visible  xpath=/html/body/sy-root/div/sy-draft-edit/div/div[2]/div[2]/form/sy-fields/div/div[19]/div/sy-field/fieldset/sy-single-field/div/div/sy-input-reference/div/div/div/p-dropdown/div/div[3]
  Click Element   xpath=/html/body/sy-root/div/sy-draft-edit/div/div[2]/div[2]/form/sy-fields/div/div[19]/div/sy-field/fieldset/sy-single-field/div/div/sy-input-reference/div/div/div/p-dropdown/div/div[3]
  Get Select List Label  xpath=//*[@id="b075830b-9ebe-4839-8551-17d77c82572ftarget"]/li  Civil Works / Biosite / 10.104 / RSU SPC / CLARO / SMSMT53 / Fornecedor Teste 5cffc13dfdfd4a512f065072 / tvcbUQwem5
  Input Text   id=titulo   Teste
  Input Text   id=descricao  Teste


Fechar Navegador
#   Close Browser
