# encoding: utf-8

include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Rendering

require "time"

MESI = %w(nil, gennaio febbraio marzo aprile maggio giugno luglio agosto settembre ottobre novembre dicembre)
class Time
  def to_s
    self.strftime "%d %b %Y ore %H:%M"
  end
  def short
    self.strftime "%d-%m-%y %H:%M"
  end
  def date
    mese = MESI[month]
    self.strftime("%d #{mese} %Y")
  end
  def to_number
    self.strftime "%d-%m-%Y"
  end
end

def last_article
  sorted_articles.first
end

def recent_articles
  sorted_articles.take(5)
end

def old_articles
  sorted_articles.drop 4
end

def articles_in_category(category)
  sorted_articles.select {|i| i[:category] == category}
end

class String
  def first_par
    self[/^.+\<\/p\>/]
  end
  def cut
    if self.size < 400
      self
    else
      s = self[0..400].gsub(/ \w+$/," [...]")
      Nokogiri::HTML::DocumentFragment.parse(s).to_s
    end
  end
end

