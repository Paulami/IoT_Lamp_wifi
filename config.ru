require 'sinatra'
require 'json'
require 'open-uri'


class PingApp < Sinatra::Base
  set :dweet_name, "iot-lamp-wifi-test"

  before do
    content_type 'text/plain'
  end


  def degrees_for_timestamp
    date = get_last_timestamp

    if date.monday?
      10
    elsif date.tuesday?
      20
    elsif date.wednesday?
      30
    elsif date.thursday?
      40
    elsif date.friday?
      50
    elsif date.saturday?
      60
    else  # then it should be sunday
      70
    end
  rescue
    0 # default
  end


  def latest_dweet_url
    "https://dweet.io/get/latest/dweet/for/#{settings.dweet_name}"
  end


  def get_last_timestamp
    response = open(latest_dweet_url).read
    unix_timestamp = JSON(response)["with"][0]["content"]["last_ping_timestamp"]
    Time.at(unix_timestamp.to_i).to_datetime
  end


  get '/' do
    degrees_for_timestamp.to_s
  end


  get "/ping" do
    unix_timestamp = Time.now.to_time.to_i
    save_dweet_url = "https://dweet.io/dweet/for/#{settings.dweet_name}?last_ping_timestamp=#{unix_timestamp}"
    response = open(save_dweet_url).read
    "ok"
  end

end

run PingApp
