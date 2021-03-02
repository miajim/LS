require 'socket' # socket library, includes classes to create servers & interact w/ servers, other networking tasks

def parse_request(request_line)
  # obtain the parameters from the request
  http_method, path_and_params, http = request_line.split(" ")
  path, params = path_and_params.split("?")

  params = params.split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept # waits until someone tries to request something from the server, server accepts call and opens a connection to the client, returns a client object

  request_line = client.gets # gets the first line of the request (what the client is trying to retrieve from the server)
  next if !request_line || request_line =~ /favicon/
  puts request_line # output the request line to the console

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>" # pre tag displays the content that follows to the user w/o any mods, preserving white space
  # client.puts request_line # send it back to the client so it appears in the web browser
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>" 

  client.puts "<h1>Rolls!</h1>"

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do 
    roll = rand(sides) + 1
    client.puts "<p>", roll, "</p>"
  end

  client.puts "</body>"
  client.puts "</html>"
  client.close # close the connection
end
