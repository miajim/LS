require 'socket' # socket library, includes classes to create servers & interact w/ servers, other networking tasks

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept # waits until someone tries to request something from the server, server accepts call and opens a connection to the client, returns a client object

  request_line = client.gets # gets the first line of the request (what the client is trying to retrieve from the server)
  puts request_line # output the request line to the console

  # crhome expects a well-formed response to send before rendering
  client.puts "HTTP/1.1 200 OK"
  # client.puts "Content-Type: text/plain\r\n\r\n"

  client.puts request_line # send it back to the client so it appears in the web browser
  client.close # close the connection
end
