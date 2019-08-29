
Dado("que {string} é um novo filme") do |codigo|
   file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
   @movie = file[codigo]
   Database.new.delete_movie(@movie["title"])
end

Dado("este filme já existe no catálogo") do
   Database.new.insert_movie(@movie)
end
 
 Quando("eu faço o cadastro deste filme") do
    @movie_page.add
    @movie_page.form.create(@movie)
   
 end
 
 Então("devo ver o novo filme na lista") do
  result = @movie_page.movie_tr(@movie["title"])
  #validando o titulo do filme
  expect(result).to have_text @movie["title"]
  #validando o status do filme
  expect(result).to have_text @movie["status"]

end

Então("devo ver a notificação {string}") do |expect_alert|
   expect(@movie_page.form.message).to eql expect_alert
end


Então("devo ver a mensagem de erro {string}") do |alert|
   expect(@movie_page.form.message_erro).to eql alert
end



Dado("que {string} está no catálogo") do |movie_code|
   #dynamic steps
   steps %{
       Dado que "#{movie_code}" é um novo filme
       E este filme já existe no catálogo    
   }
   
end

Quando("eu solicito a exclusão") do
   @movie_page.remove(@movie["title"])
end

Quando("eu confirmo a solicitação") do
   @movie_page.sweet_alert.confirm
end

Então("este item deve ser removido do catálogo") do
   expect(@movie_page.has_no_movie(@movie["title"])).to be true
end

Quando("cancelo a solicitação") do
   @movie_page.sweet_alert.cancel
end
 
Então("este item deve permanecer no catálogo") do
expect(@movie_page.has_movie(@movie["title"])).to be true
end
 
