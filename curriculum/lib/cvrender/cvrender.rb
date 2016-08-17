require 'json'
require 'erb'

class CVSection
  attr_reader :position, :title, :file

  def initialize(position, title, file)
    @position = position.to_i
    @title = title.to_s
    @file = file.to_s
  end

  def <=>(other)
    @position <=> other.position
  end
end

class CVConfig
  def initialize(config_file)
    @config = JSON.parse(File.read(config_file))
  end

  def get_main_file
    @config["main_file"]
  end

  def get_sections_files
    @sections ||= load_sections()

    @sections.sort.map{|s| s.file}
  end

  def get_section_title_by_file(filename)
    @sections ||= load_sections()

    @sections.select{|s| s.file == filename}.first.title
  end

  private

  def load_sections
    sections = []
    @config['sections'].each_pair do |position, infos|
      sections << CVSection.new(position, infos["title"], infos["file"])
    end
    sections
  end
end


class CVRender
  CONFIG = "config.json"

  def initialize(fields)
    load_fields(fields)
  end

  def render!
    @structure = CVConfig.new(CONFIG)

    [
      @structure.get_sections_files(),
      @structure.get_main_file()
    ].flatten.each do |file|
      render_file(File.basename(file, ".erb"), file)
    end
  end

  private

  def load_fields(fields)
    fields.each_pair do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end

  def render_file(output, template)
    erb_tpl = ERB.new(File.read(template))
    erb_tpl.filename = template
    File.open(output,  "w+") do |file|
      file.write(erb_tpl.result(binding))
    end
  end
end

if __FILE__ == $0
  render = CVRender.new(JSON.parse(File.read("curriculo.json")))
  render.render!
end
