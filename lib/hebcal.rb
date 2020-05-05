require "hebcal/version"

module Hebcal
  class Error < StandardError; end

  require 'rubygems'
  require 'rest-client'
  require 'json'

  BASE_URL = 'https://www.hebcal.com/converter/'
  
  PARAM_START = '?'
  
  SEP = '&'
  
  CFGJSON = 'cfg=json'

  G2H = 'g2h=1'

  def self.g2d(date) 

    url = BASE_URL +
      PARAM_START +
      CFGJSON +
      SEP +
      date_url(date) +
      SEP +
      G2H

    puts "url=#{url}"

    response = RestClient.get(url)

    format_response(response.body)
      
  end

  def self.date_url(date)

    return 'gy=' + date.year.to_s +
      SEP +
        'gm=' + date.month.to_s +
      SEP +
      'gd=' + date.day.to_s

  end

  def self.format_response(response)

    response_hash = JSON.parse(response)

    retval = response_hash['gd'].to_s + ' ' +
      Date::MONTHNAMES[response_hash['gm']] + ' ' +
      response_hash['gy'].to_s + ' (' +
      response_hash['hd'].to_s + ' ' +
      response_hash['hm'].to_s + ' ' +
      response_hash['hy'].to_s + ')'

    retval
  end

end
