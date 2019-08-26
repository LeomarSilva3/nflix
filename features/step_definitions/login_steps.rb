

Quando("eu faço login com {string} e {string}") do |email, senha|
   @login_page.go
   @login_page.with(email, senha)

end

Então("devo ser autenticado") do
   
    # verificar se o usuario está realmente authenticado atravez do seu token
    expect(get_token.length).to be 147
end

Então("devo ver {string} na area logada") do |usuario|
   #verificar o text na pagina
   expect(@sidebar.logged_user).to eql usuario
end


Então("não devo ser autenticado") do
  #verifica se o usuario não criou um token d autenticação
   expect(get_token).to be nil
end

Então("devo ver a mensagem de alerta {string}") do |texto|
  expect(@login_page.alert).to eql texto
end
