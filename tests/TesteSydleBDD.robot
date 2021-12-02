*** Settings ***
Resource  ../resources/Resource.robot
# Resource  ../resources/PageObject/Home.robot
# Resource  ../resources/PageObject/Pesquisar.robot
Suite Setup          Abrir Sessao
# Suite Teardown       Fechar Navegador

*** Test Case ***
Caso de Teste 01: Logar no ambiente da Sydle
  Dado que eu efetue o login
  Quando eu logar no ambiente da Sydle
  Então eu devo verificar se a página Home foi exibida
  
  
Caso de Teste 02: Entrar em Explorer no menu sidebar 
  Dado que eu esteje na página Home da Sydle
  Quando eu clicar no botão para exibir o sidebar 
  Então eu devo clicar em Explorer 

Caso de Teste 03: Pesquisar e clicar no produto 
  Dado que eu clique no + para Pesquisar
  Quando eu clicar na categoria todos e digitar "Retirada de Pendências" na barra de pesquisa
  Então eu devo clicar no botão de pesquisar e clicar no Objeto

Caso de Teste 04: Preencher e concluir a obra
  Dado que eu clique nos campos da obra
  # Quando os campos forem preenchidos
  # Então eu devo concluir a obra
