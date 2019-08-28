require "pg"

class Database


    def delete_movie(title)
        connection = PG.connect(host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja")
        
        connection.exec("DELETE from public.movies where title = '#{title}'")
    end

    def insert_movie(movie)
        connection = PG.connect(host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja")

        sql_script = "INSERT INTO public.movies(title,status,year, release_date,created_at, updated_at)" \
        " VALUES('#{movie['title']}', '#{movie['status']}', #{movie['year']}, '#{movie['release_date']}', current_timestamp, current_timestamp);"
        
        connection.exec(sql_script)

    end

end