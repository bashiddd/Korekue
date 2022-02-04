require 'net/http'
require 'uri'
require 'json'
class HomeController < ApplicationController
  def top
  end

  def show

    uri = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=26.2523872%20127.765923&radius=2500&type=restaurant&maxprice=3&language=ja&key=AIzaSyDKXFfdpoNWmL65JRpq1Ue3HC-mL38aPMA")
    res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) {|http|
      http.get(uri)}

    korekue = JSON.parse(res.body)
    
    ary = Array.new
    korekue['results'].each do |result|
      ary.push result
    end

    @korekue = ary.sample.slice('vicinity','name')
    
  end
end
