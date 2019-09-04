#language: pt
@login_
Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catalogo ninjaFlix
    Sendo um usuario previamente cadastrado
    Posso acessar o sistema com meu email  e senha

@login_happy 
Cenario: Acesso
    Quando eu faço login com "tony@stark.com" e "pwd123"
    Então devo ser autenticado
    E devo ver "Tony Stark" na area logada

#cenario outline com DDT(Testes guiado por dados)
@login_hapless
Esquema do Cenario: Logim sem sucesso
    Quando eu faço login com <email> e <senha>
    Então não devo ser autenticado 
    E devo ver a mensagem de alerta <texto>
     
     Exemplos:
      | email              | senha      | texto                          |
      | "tony@stark.com"   | "545y4"    | "Usuário e/ou senha inválidos" |
      | "sdfgdf@gmail.com" | "12342"    | "Usuário e/ou senha inválidos" |
      | ""                 | "abcsdffg" | "Opps. Cadê o email?"          |
      | "teste@gmail.com"  | ""         | "simulando um erro?"          |


