#language: pt
@login
Funcionalidade: Cadastro de Filmes
    Para que eu possa disponibilizar novos titulos no catalogo
    Sendo um gestor de catalogo
    Posso cadastrar um novo Filmes
    
    @new_movie
    Esquema do Cenario: Novo Filme
        O gestor de catalogo cadastrar um novo filme atraves do formulario
        e um novo registro é inserido no catalogo NinjaFlix

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro deste filme
        Então devo ver o novo filme na lista

        Exemplos:
            | codigo     |
            | "ultimato" |
            | "spider"   |
            | "jocker"   | 

    @attempt_movie
    Esquema do Cenario: Campos Obrigtorios
       O gestor de catálogo tenta cadastrar um novo filme, mas esquece 
       de preeencher um dos campos obrigatórios, em seguida, o sistema
       exibe uma notificação para o usuário

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro deste filme    
        Então devo ver a notificação <texto>

        Exemplos:
            | codigo      |  texto                                         |  
            | "no_title"  | "Oops - Filme sem titulo. Pode isso Arnaldo?"  |
            | "no_status" | "Oops - O status deve ser informado!"          |
            | "no_year"   | "Oops - Faltou o ano de lançamento também!"    |
            | "no_date"   | "Oops - Quase lá, só falta a data de estréia!" |

    @dup_movie
    Cenario: Duplicado            
       Dado que "deadpool2" é um novo filme
       E este filme já existe no catálogo     
       Quando eu faço o cadastro deste filme
       Então devo ver a notificaçãoo "Oops - Este titulo já existe no Ninjaflix."