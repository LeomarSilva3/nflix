class MoviePage 
    include Capybara::DSL
     

    def add
       find('.nc-simple-add').click
    end  
    
    def add_cast(cast)
    
        actor = find('.input-new-tag')
        
        cast.each do |a|
            actor.set a 
            actor.send_keys :tab
        end

    end



    def upload(file)
        cover_file =   File.join(Dir.pwd, "features/support/fixtures/cover/" + file)
        ## no windos tem que converter o formato das barras mais para isso instala a gem "os"
        cover_file = cover_file.tr("/","\\") if OS.windows?
        #ignora os elementos ocultos
        Capybara.ignore_hidden_elements = false
        attach_file("upcover", cover_file)
        #retorna os elemento ocultos  
        Capybara.ignore_hidden_elements = false  
    end


    
    def create(movie)
        find('input[name=title]').set movie["title"]
        find('input[placeholder=Status]').click
        find('.el-select-dropdown__item', text:movie["status"]).click
        find('input[name=year]').set movie["year"]
        find('input[name=release_date]').set movie["release_date"]
        find('input[name=release_date]').send_keys :tab

        add_cast(movie["cast"])

        find('textarea[name=overview]').set movie["overview"]
    
        upload(movie["cover"])

        find('#create-movie').click
    end    
    

    def movie_tr(movie)
      find('table tbody tr', text: movie["title"])
    end
    
end    