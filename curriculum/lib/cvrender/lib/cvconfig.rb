require 'json'

class CVSection
  attr_reader :position, :title, :file

  def initialize(position, title, file)
    @position = position.to_i
    @title = title.to_s
    @file = file.to_s
  end

  def texfile
    File.basename(@file, ".erb")
  end

  def <=>(other)
    @position <=> other.position
  end
end

class CVConfig
  def initialize(config_file, basepath)
    @config = JSON.parse(File.read(config_file))
    @basepath = basepath
  end

  def get_templates
    @sections ||= load_sections()

    [get_main_erbfile()] + @sections.sort.map{|s| s.file}
  end

  def get_main_erbfile
    File.join(@config['path'], @config["main_file"])
  end

  def get_main_texfile
    File.basename(@config["main_file"], ".erb")
  end

  def get_sections_texfiles
    @sections ||= load_sections()

    @sections.sort.map{|s| s.texfile}
  end

  def get_section_title_by_file(filename)
    @sections ||= load_sections()

    @sections.select{|s| s.file == filename}.first.title
  end

  private

  def load_sections
    sections = []
    @config['sections'].each_pair do |position, infos|
      sections << CVSection.new(position,
                                infos["title"],
                                File.join(@config['path'], infos["file"]))
    end
    sections
  end
end
