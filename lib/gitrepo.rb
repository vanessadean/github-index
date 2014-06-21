class GitRepo
  attr_reader :filename, :remote
  def initialize(filename)
    @filename = filename
    @remote = ""
  end

  def find_remote()
    file = File.new(filename, "r")
    while (line = file.gets)
      if line.start_with?("[remote")
        @remote = file.gets.gsub("url = git@github.com:", "https://github.com/")
        break
      end
    end
    file.close
    @remote
  end


end