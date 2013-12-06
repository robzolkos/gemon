require 'rack/test'
require "gemon"
require "multi_json"

describe Gemon::Server do
  include Rack::Test::Methods

  def app
    Gemon::Server.new
  end

  it "returns the ruby version" do
    get '/'
    ruby_version = `ruby -v`.split[1]
    expect(json_parse(last_response.body)[:ruby]).to eq(ruby_version)
  end

  private

  def json_parse(body)
    MultiJson.load(body, symbolize_keys: true)
  end

end
