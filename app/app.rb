require 'cowsapi/cow'

module Cowsapi
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    get :index do
      "".tap do |str|
        Cow.all.each{|c| str << "#{c.name}\n"}
      end
    end

    get :index, :with=> [:name, :say], :provides=> [:html, :txt, :jpg, :png, :gif] do
      cow = Cow.get(params[:name])
      convert(cow ? cow.say(params[:say]) : halt(404, "No such cow: #{params[:name]}"), params)
    end

    def convert (string, params)
      case content_type
      when *[:jpg, :gif, :png]
        f = Tempfile.new('cow')
        begin
          f.write(string)
          f.rewind
          `convert -font Courier #{dimensions} label:@#{f.path} #{content_type}:-`
        ensure
          f.close
          f.unlink
        end
      when :html
        <<-eos
    <html>
      <body>
        <img style="padding-left:30px" src="#{request.scheme}://#{request.host}/#{params[:name]}/#{params[:say]}.png" />
      </body>
    </html>
        eos
      else 
        string
      end
    end

    def dimensions
      x = params[:x].nil? ? 320 : params[:x]
      y = params[:y].nil? ? 240 : params[:y]
      "-size #{x}x#{y}"
    end
  end
end
