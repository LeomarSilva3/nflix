# técnica do suport code do cucumber
module Helpers
    def get_token
        #tempo de busca por default do capybara 2 segundos
        timeout = Capybara.default_max_wait_time
        #loop
        timeout.times do
            js_script = 'return window.localStorage.getItem("default_auth_token");'
            @token = page.execute_script(js_script)
            sleep 0.2
        end
        #retorna o valor do token
        @token
   
    end
end