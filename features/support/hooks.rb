#Before gereric
Before do
    page.current_window.resize_to(1920, 1080) 
    @login_page = LoginPage.new
    @sidebar = SidebarView.new
    @movie_page = MoviePage.new 
end

#Before from Movies
Before("@login") do
    @login_page.go
    @login_page.with("tony@stark.com", "pwd123")

end
