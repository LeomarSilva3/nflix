class LoginPage
     include Capybara::DSL

    def go
        visit "/"
    end

    def with(email, senha)
       find("input[id=emailId]").set email
       find("input[id=passId]").set senha
       click_button "Entrar"
    end
    
    def alert()
        find('.alert span').text
    end 

end    
    