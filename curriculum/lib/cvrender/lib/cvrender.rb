require 'erb'
require 'cvconfig'
require 'cvcompiler'

class CVRender
  def initialize(fields, config)
    load_fields(fields)
    @config = config
  end

  def render(outputname, outputdir)
    @config.get_templates().each do |file|
      outputfile = File.join(outputdir, File.basename(file, ".erb"))
      render_file(outputfile, file)
    end

    CVCompiler.compile(@config.get_main_texfile(), outputname, outputdir)
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
    File.open(output, "w+") do |file|
      file.write(erb_tpl.result(binding))
    end
  end
end


