require "jekyll"
require "jekyll-hebcal/version"
require "date"
require "rest-client"
require "json"

module Jekyll
  module Hebcal

    class HebcalTag < Liquid::Tag

      BASE_URL = 'https://www.hebcal.com/converter/'
  
      PARAM_START = '?'
      
      SEP = '&'
      
      CFGJSON = 'cfg=json'
    
      G2H = 'g2h=1'
    
      def initialize(tagName, tagText, tokens)
        super
        @text = tagText
      end

      def render(context)

        begin
          gregorian_date = Date.parse("#{@text}")
        rescue
          %Q{#{@text}}
        else
          %Q{#{g2d(gregorian_date)}}
        end
        
      end

      def g2d(date) 

        url = BASE_URL +
          PARAM_START +
          CFGJSON +
          SEP +
          date_url(date) +
          SEP +
          G2H
    
        response = RestClient.get(url)
    
        format_response(response.body)
          
      end
    
      def date_url(date)
    
        return 'gy=' + date.year.to_s +
          SEP +
            'gm=' + date.month.to_s +
          SEP +
          'gd=' + date.day.to_s
    
      end
    
      def format_response(response)
    
        response_hash = JSON.parse(response)
    
        gd = response_hash['gd']
        hd = response_hash['hd']

        retval = gd.to_s + ordinal(gd) + ' ' +
          Date::MONTHNAMES[response_hash['gm']] + ' ' +
          response_hash['gy'].to_s + ' (' +
          hd.to_s + ordinal(hd) + ' ' +
          response_hash['hm'].to_s + ' ' +
          response_hash['hy'].to_s + ')'
    
        retval
      end

      def ordinal(number)

        if number == 1 || number == 21 || number == 31
          ordinal = 'st'
        elsif number == 2 || number == 22
          ordinal = 'nd'
        elsif number == 3 || number == 23
          ordinal = 'rd'
        else 
          ordinal = 'th'
        end

        "<sup>#{ordinal}</sup>"
      end
    end
  end
end
Liquid::Template.register_tag('hebcal',Jekyll::Hebcal::HebcalTag)