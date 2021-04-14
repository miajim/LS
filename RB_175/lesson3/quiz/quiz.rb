require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

set :show_exceptions, :after_handler

get "/course/:course/instructor/:instructor" do |course, instructor|
  # set up data for ERB here
  @course_id = course
  @instructor_id = instructor

  erb :index
end

error do
  "ERROR" + env['sinatra.error'].message
end

get "/" do
  "Main" 
end

not_found do
  location = "/new"
end