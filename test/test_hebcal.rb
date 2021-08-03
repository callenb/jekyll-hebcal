puts "#### IN test_hebcal.rb"
require File.dirname(__FILE__) + '/test_helper.rb'
class TestMyBirthdate < MiniTest::Test #:nodoc:
    include Liquid

    def setup
        @tagname='hebcal'
    end
    
    def test_how_to_test
        markup = '10 Jun 1963'
        expected = '10 June 1963 (18 Sivan 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal('jekyll::hebcal::hebcaltag', tag.name)
        assert_equal(expected, tag.render(Context.new))
    end
    
  end