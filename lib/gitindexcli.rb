require_relative 'gitindex.rb'
require 'pathname'
class GitIndexCLI
  attr_reader :directory, :path
  def call
    greeting
    input = gets.chomp
    if input.downcase != "exit"
      directory_from_input(input)
      determine_path
      filename = create_file
      `open #{filename}`
    end
  end

  private
  def greeting
    puts "What directory would you like to map?"
    puts "(leave blank for present working directory)"
  end

  def directory_from_input(input)
    input.strip.empty? ? @directory = (Dir.pwd) : @directory = input
  end

  def determine_path
    puts "Dir #{@directory}"
    @path = Pathname.new(@directory)
    if path.relative?
      @path = path.expand_path
    end
  end

  def create_file
    file = "#{path}/index.html"
    puts "Mapping #{path}..."
    $stdout.reopen(file, "w")
    index = GithubIndex.new(path)
    index.generate_index
    return file
  end
end