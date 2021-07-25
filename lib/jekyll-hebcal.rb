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
    
      def initialize(tagName, content, tokens)
        super
        @content = content
      end

      def render(context)
        date_as_text = "#{context[@content.strip]}"
        date_as_date = parse_datetime(date_as_text)

        if is_datetime(date_as_date)
          %Q{IT IS A DATE #{date_as_text} #{g2d(date_as_date)}}
        else
          %Q{IT IS NOT A DATE #{context[@content]}}
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
    
        retval = response_hash['gd'].to_s + ' ' +
          Date::MONTHNAMES[response_hash['gm']] + ' ' +
          response_hash['gy'].to_s + ' (' +
          response_hash['hd'].to_s + ' ' +
          response_hash['hm'].to_s + ' ' +
          response_hash['hy'].to_s + ')'
    
        retval
      end

      def parse_datetime(date_as_text)
        DateTime.parse(date_as_text)
      end

      def is_datetime(possible_datetime)

        puts "##### #{(possible_datetime.is_a?(DateTime))} ######"
        possible_datetime.is_a?(DateTime) ? true : false
      end

    end
  end
end
Liquid::Template.register_tag('hebcal',Jekyll::Hebcal::HebcalTag)