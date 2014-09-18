#!/usr/bin/env ruby

require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET (request, response)
    host = request['Host'].split(':').first
    if host =~ /install\.recipes$/
      path = host.split('.')[0..-3].reverse.join('/')+'/install.sh'
    else
      path = 'help.txt'
    end

    response.status = 302
    response['Location'] = "https://raw.githubusercontent.com/zeroXten/install.recipes/master/recipes/#{path}"
  end
end

server = WEBrick::HTTPServer.new(:Port => 1234)
 
server.mount "/", MyServlet
 
trap("INT") {
    server.shutdown
}
 
server.start
