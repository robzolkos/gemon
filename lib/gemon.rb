require "gemon/version"
require "sinatra/base"
require "bundler"
require "json"

module Gemon
  class << self

    attr_accessor :api_key

  end

  class Server < Sinatra::Base

    dir = File.dirname(File.expand_path(__FILE__))

    set :static, true

    get '/' do
      content_type :json

      if !Gemon.api_key.nil?
        if params[:key] != Gemon.api_key
          return {:error => "Invalid Key"}.to_json
        end
      end

      dir = File.expand_path("..",Dir.pwd)
      dir = Dir.pwd
      gemfile = dir + "/Gemfile.lock"
      lockfile = Bundler::LockfileParser.new(Bundler.read_file(gemfile))
      {
        :ruby => ruby_version,
        :os => {
          name: `uname -s`.strip,
          platform: `uname -m`.strip,
          release: `uname -r`.strip,
          nodename: `uname -n`.strip
        },
        :directory => dir,
        :gemfile => get_gems(lockfile)
      }.to_json
    end

    private

    def ruby_version
      begin
        return `ruby -v`.split[1]
      rescue
        return "Error: Ruby not found."
      end
    end

    def get_gems(lockfile)
      a = []
      lockfile.dependencies.each do |d|
        spec = lockfile.specs.select { |s| s.name == d.name }
        version = ""
        version = spec[0].version if !spec[0].nil?
        a << {name: d.name, requirement: d.requirement, locked: version}
      end
      a
    end

  end

end
