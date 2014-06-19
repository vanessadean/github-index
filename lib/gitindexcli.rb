require_relative 'gitindex.rb'
class GitIndexCLI
  def call
    puts "What directory would you like to map?"
    puts "(leave blank for present working directory)"
    directory = gets.chomp
    if directory.downcase != "exit"
      directory = (Dir.pwd) if directory.strip.empty?
      path = Pathname.new(directory)
      if path.relative?
        path = path.expand_path
      end
      file = "#{path}/index.html"
      puts "Mapping #{path}..."
      $stdout.reopen(file, "w")
      index = GithubIndex.new(path)
      index.generate_index
      `open #{file}`
    end
  end
end