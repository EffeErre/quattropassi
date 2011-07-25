# encoding: utf-8

class Lyx < Nanoc3::Filter
  identifier :lyx
  type :text

  def run(content, params={})
    body = item[:doc].css("body").first

    # Rimuove le ancore inutili
    body.css('a[id^="magicparlabel"]').unlink

    # Sistema le immagini
    body.css('img').each do |img|
      src = /^.+_images_(.+)$/.match(img["src"])
      img["src"] = "/images/" + $1
      dir = File.dirname @item[:filename]
      system "rm #{dir + '/' + $~.to_s}"
    end

    # Trasforma i div.standard in p
    body.css('div.standard').each do |div|
      p = Nokogiri::XML::Node.new "p", item[:doc]
      p.children = div.children
      div.after p
      div.unlink
    end

    body.children.to_html
  end
end
