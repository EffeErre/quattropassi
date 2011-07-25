require 'nanoc3/tasks'
require 'fileutils'

desc 'Creates a new blog posts, and opens it on Textmate'
task :post do |t|

  puts "Titolo:"
  title = STDIN.gets.chomp

  puts "Categoria:"
  category = STDIN.gets.chomp

  path = "./content/#{category.downcase}/"
  filename = "#{title.gsub(/\W+/, "-").gsub(/^-/, "").downcase}.md"
  filename_path = File.join(path, filename)

  FileUtils.mkdir_p path
  File.open filename_path, 'w' do |f|
    f.puts "---"
    f.puts "title: #{title}"
    f.puts "kind: article"
    f.puts "created_at: #{DateTime.now.strftime("%Y-%m-%dT%H:%M")} #_"
    f.puts "---"
    f.puts
  end

  `gvim #{filename_path} +`
end
