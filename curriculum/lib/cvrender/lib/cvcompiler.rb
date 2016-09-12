require 'fileutils'

class CVCompiler
  def self.compile(file, outputname, outputdir)
    cmd  = "xelatex -interaction=nonstopmode -jobname=#{outputname} "
    cmd += "-output-directory=. #{file}"

    FileUtils.cd(outputdir) do
      `#{cmd}`
    end
  end
end
