# Leads Management

## Imagens

![Telas](https://github.com/rvgcampos/leads-management/blob/main/src/assets/telas.png)

## Para executar

Basta executar os seguintes comandos

> npm i

> npm run serve

## Fluxo

1. Ao entrar no site é necessário realizar um cadastro, onde a senha tem que ter pelo menos um caractere especial, numérico, letra minuscula, letra maiuscula
1. Logo após o cadastro ter sido realizado, o usuário entrará na tela de Leads automaticamente
1. Assim sendo, o usuário pode clicar no botão 'Novo Lead (+) e ir para tela quer permitirá cadastrar um novo Lead
1. Estando nessa tela, basta o usuário preencher os dados corretamente e clicar em 'Salvar'
1. Feito isso, uma mensagem aparecerá indicando que o cadastro foi feito com sucesso e logo após o usuário será redirecionado para a tela de Leads

## Funcionalidades

1. Foi feito o uso do Vuex para o gerenciamento de estado.
1. Foi feita a validação no formulário de Login
1. Foi feita a validação no formulário de cadastro. Para validar a senha foi criada uma função que está contida na pasta /utils
1. Foi feita a proteção de rotas, onde certas rotas como '/leads' e '/new_lead' só podem ser acessar por usuários logados
1. No momento do cadastro é verificado se o que ser quer cadastrar já existe, caso exista, o sistema não deixa.
1. No momento do cadastro é feito a criptografia da senha e no momento do login a descriptografia
1. Como pedido no Desafio, foi feito o bloqueio do drag and drop para determinadas condições
1. Tela de Leads mostra o nome do usuário logado obtido a partir do localStorage
1. Na tela de cadastrar uma nova Lead, quando a Lead é salvar com sucesso uma mensagem aparece suavemente e logo após o usuário é levado para a tela de Leads. Foi feito o uso de transactions do VueJS
1. Nessa mesma tela de Cadastro foi feito o uso do Regex para validar os campos de Telefone e Email

## Link

O site pode ser acessado por [esse link](https://hardcore-raman-f81463.netlify.app)
