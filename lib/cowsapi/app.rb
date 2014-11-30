$:.unshift(File.dirname(__FILE__))
require 'cowsapi'
require 'cowsapi/cow'
require 'sinatra'
require 'shellwords'

module Cowsapi
  class App < Sinatra::Base

    before do
      content_type 'text/plain'
    end

    get '/' do
      "".tap do |str|
        Cow.all.each{|c| str << "#{c.name}\n"}
      end
    end

    get '/:name/:say' do
      cow = Cow.get(params[:name])
      convert(cow ? cow.say(params[:say]) : halt(404, "No such cow: #{params[:name]}"), params)
    end

    get '/fb/:name/:say' do
      content_type 'text/html'
      <<-eos
    <html>
      <body>
        <img style="padding-left:30px" src="#{request.scheme}://#{request.host}/#{params[:name]}/#{params[:say]}?format=png" />
      </body>
    </html>
      eos
    end

    def convert (string, params)
      format = params[:format]
      if format
        if %w'jpg gif png'.include?(format)
          content_type "image/#{format}"
          f = Tempfile.new('cow')
          begin
            f.write(string)
            f.rewind
            `convert -font Courier #{dimensions(params)} label:@#{f.path} #{format}:-`
          ensure
            f.close
            f.unlink
          end
        end
      else
        string
      end
    end

    def dimensions(params)
      x = params[:x].nil? ? 320 : params[:x]
      y = params[:y].nil? ? 240 : params[:y]
      "-size #{x}x#{y}"
    end
  end
end
