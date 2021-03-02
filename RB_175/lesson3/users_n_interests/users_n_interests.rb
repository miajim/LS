require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'yaml'

before do
  @users_hsh = YAML.load(File.read("users.yaml"))
  @users = @users_hsh.keys.map(&:to_s)
end

get "/" do 
  erb :home
end

not_found do
  redirect "/"
end

get "/:name" do
  if @users.include?(params[:name])
    @user = params[:name].to_sym
    @email = @users_hsh[@user][:email]
    @interests = @users_hsh[@user][:interests]
    erb :user
  else
    not_found
  end
end

helpers do 
  def count_interests(hsh)
    users = hsh.keys
    users.map do |user|
      hsh[user][:interests].size
    end.sum
  end
end
