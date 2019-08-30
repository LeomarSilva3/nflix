# técnica do suport code do cucumber
module Helpers

    #melhora a peformance dabusca do token usando um break
    def get_token
        #loop
        2.times do
            js_script = 'return window.localStorage.getItem("default_auth_token");'
            @token = page.execute_script(js_script)
            break if @token != nil
            sleep 1
        end
        #retorna o valor do token
        @token
   
    end
end