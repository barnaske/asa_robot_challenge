*** Settings ***
Documentation    Projeto de automação de testes utilizando Robot Framework
Resource    resources.robot

*** Test Cases ***
Efetuar criação de um Post
    Given O usuário possua uma sessão criada para a API
    When Efetuar uma requisição "POST" com o parametro "" e com o corpo "{"title": "Primeiro Post", "body": "primeiro post", "userId": 43690}"
    Then Receberá um status code "201"
    And O corpo da response conterá o campo "'id': 101"
    And O corpo da response conterá o campo "'title': 'Primeiro Post'"
    And O corpo da response conterá o campo "'body': 'primeiro post'"
    And O corpo da response conterá o campo "'userId': 43690"

Obter todos os posts
    Given O usuário possua uma sessão criada para a API
    When Efetuar uma requisição "GET" com o parametro "" e com o corpo ""
    Then Receberá um status code "200"
    And A lista de retorno conterá "100" elementos

Obter Post específico
    Given O usuário possua uma sessão criada para a API
    When Efetuar uma requisição "GET" com o parametro "1" e com o corpo ""
    Then Receberá um status code "200"
    And O corpo da response conterá o campo "'id': 1"

Atualizar Post específico
    Given O usuário possua uma sessão criada para a API
    When Efetuar uma requisição "PUT" com o parametro "75" e com o corpo "{"title": "Atualizando post", "body": "Post atualizado", "userId": 43690}"
    Then Receberá um status code "200"
    And O corpo da response conterá o campo "'id': 75"
    And O corpo da response conterá o campo "'title': 'Atualizando post'"
    And O corpo da response conterá o campo "'body': 'Post atualizado'"
    And O corpo da response conterá o campo "'userId': 43690"

Deletar um Post específico
    Given O usuário possua uma sessão criada para a API
    When Efetuar uma requisição "DELETE" com o parametro "1" e com o corpo ""
    Then Receberá um status code "200"