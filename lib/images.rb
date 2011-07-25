# encoding: utf-8
class ResizeFilter < Nanoc3::Filter
  identifier :resize
  type :binary

  def run(filename, params={})
    system("convert -resize 620 -quality 70 -strip #{filename} #{output_filename}")
  end
end
