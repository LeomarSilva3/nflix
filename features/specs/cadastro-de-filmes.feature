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

            