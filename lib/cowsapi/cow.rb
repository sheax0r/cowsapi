require 'shellwords'
require 'cowsapi'

module Cowsapi

  class Cow
    class << self
      def all
        puts "getting all cows"
        lines = `cowsay -l`.split("\n")
        [DefaultCow.new].tap do |cows|
          lines[1..-1].each do |line|
            line.split.each do |c|
              cows << Cow.new(c)
            end
          end
        end
      end

      def get(name)
        all.detect{|cow|
          cow.name == name
        }
      end
    end

    attr_reader :name
    def initialize(name)
      @name = name
    end

    def say(string)
      `cowsay -f #{name} #{Shellwords.escape(string)}`
    end
  end

  class DefaultCow
    def name
      'cow'
    end

    def say(string)
      `cowsay #{Shellwords.escape(string)}`
    end
  end
end
