puts "<!doctype html>"
puts "<html>"
puts "  <head><title>Randall's Flatiron Curriculum</title></head>"
puts "  <body>"
base_dir = "#{Dir.pwd}/Curriculum"
base_repo = "https://github.com/randallreedjr/"
weeks = Dir.entries(base_dir).slice(2..-1)
puts "<ul>"
weeks.each do |week|
  puts "<li>#{week}"
  puts "<ul>"
  days = Dir.entries("#{base_dir}/#{week}").slice(2..-1)
  days.each do |day|
    puts "<li>#{day}"
    repos = Dir.entries("#{base_dir}/#{week}/#{day}").slice(2..-1)
    puts "<ul>"
    repos.each do |repo|
      if Dir.entries("#{base_dir}/#{week}/#{day}/#{repo}").include?(".git")
        puts "<li><a href = #{base_repo}#{repo}>#{repo}</a>" 
      else
        puts "<li>#{repo}"
      end
    end
    puts "</ul>"
  end
  puts "</ul>"
end
puts "</ul>"
puts "  </body>"
puts "</html>"