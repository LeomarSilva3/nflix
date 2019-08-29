class MoviePage 
    include Capybara::DSL
     

    def form
        MovieAdd.new
    end 

    def sweet_alert
        SweetAlert.new
    end


    def add
       find('.nc-simple-add').click
    end  


    def movie_tr(title)
      find('table tbody tr', text: title)
    end

    def remove(title)
      movie_tr(title).find(".btn-trash").click
    end

    #verifica não ter o filme no catalogo
    def has_no_movie(title)
        page.has_no_css?('table tbody tr', text: title)
    end

    #verifica não ter o filme no catalogo
    def has_movie(title)
        page.has_css?('table tbody tr', text: title)
    end

    
    
end    