Feature: Login
Como um cliente
Quero poder Acessar a minha conta e me manter logado
Para que eu possa ver e responder enquetes de forma rápida

Cenario: Credencias Válidas
Dado que o cliente informou credencias Válidas
Quando solicitar para fazer Login
Então o sistema deve enviar o usuário para a tela de pesquisas
E manter o usuário conectado

Cenario: Credencias Inválidas
Dado que o cliente informou credencias Inválidas
Quando solicitado para fazer Login
Então o sistema deve retornar uma mensagem de erro