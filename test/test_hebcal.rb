puts "#### IN test_hebcal.rb"
require File.dirname(__FILE__) + '/test_helper.rb'
class TestMyBirthdate < MiniTest::Test #:nodoc:
    include Liquid

    def setup
        @tagname='hebcal'
    end
    
    def test_how_to_test
        markup = '10 Jun 1963'
        expected = '10<sup>th</sup> June 1963 (18<sup>th</sup> Sivan 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal('jekyll::hebcal::hebcaltag', tag.name)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_st_and_hebrew_st
        markup = '21 Aug 1963'
        expected = '21<sup>st</sup> August 1963 (1<sup>st</sup> Elul 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_st_and_hebrew_nd
        markup = '31 Jul 1964'
        expected = '31<sup>st</sup> July 1964 (22<sup>nd</sup> Av 5724)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_st_and_hebrew_rd
        markup = '1 Oct 1962'
        expected = '1<sup>st</sup> October 1962 (3<sup>rd</sup> Tishrei 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_st_and_hebrew_th
        markup = '1 Jan 1963'
        expected = '1<sup>st</sup> January 1963 (5<sup>th</sup> Tevet 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_nd_and_hebrew_st
        markup = '22 Jul 1963'
        expected = '22<sup>nd</sup> July 1963 (1<sup>st</sup> Av 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_nd_and_hebrew_nd
        markup = '22 Aug 1963'
        expected = '22<sup>nd</sup> August 1963 (2<sup>nd</sup> Elul 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_nd_and_hebrew_rd
        markup = '22 Sep 1962'
        expected = '22<sup>nd</sup> September 1962 (23<sup>rd</sup> Elul 5722)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_nd_and_hebrew_th
        markup = '2 Jan 1963'
        expected = '2<sup>nd</sup> January 1963 (6<sup>th</sup> Tevet 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_rd_and_hebrew_st
        markup = '23 Jun 1963'
        expected = '23<sup>rd</sup> June 1963 (1<sup>st</sup> Tamuz 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_rd_and_hebrew_nd
        markup = '22 Sep 1962'
        expected = '22<sup>nd</sup> September 1962 (23<sup>rd</sup> Elul 5722)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_rd_and_hebrew_rd
        markup = '23 Aug 1963'
        expected = '23<sup>rd</sup> August 1963 (3<sup>rd</sup> Elul 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_rd_and_hebrew_th
        markup = '3 Jan 1963'
        expected = '3<sup>rd</sup> January 1963 (7<sup>th</sup> Tevet 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_th_and_hebrew_st
        markup = '26 Mar 1963'
        expected = '26<sup>th</sup> March 1963 (1<sup>st</sup> Nisan 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_th_and_hebrew_nd
        markup = '27 Mar 1963'
        expected = '27<sup>th</sup> March 1963 (2<sup>nd</sup> Nisan 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_th_and_hebrew_rd
        markup = '28 Mar 1963'
        expected = '28<sup>th</sup> March 1963 (3<sup>rd</sup> Nisan 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end

    def test_gregorian_th_and_hebrew_th
        markup = '4 Jan 1963'
        expected = '4<sup>th</sup> January 1963 (8<sup>th</sup> Tevet 5723)'
        tag = Jekyll::Hebcal::HebcalTag.parse(@tagname, markup, Tokenizer.new(""), ParseContext.new)
        assert_equal(expected, tag.render(Context.new))
    end
  end