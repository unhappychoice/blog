class TexElement
  attr_reader :content

  def initialize(template_name, content)
    @template_name = template_name
    @content = content
  end

  def name
    "math-tex-#{Digest::MD5.hexdigest(@content)}"
  end

  def full_content
    <<~TEMPLATE
        \\documentclass[varwidth=20cm, border=1pt]{standalone}
        \\usepackage{graphicx, subcaption, tikz, amsmath}
        \\usetikzlibrary{arrows}
        #{tex_macros.join("\n")}
        \\begin{document}
        \\fontsize{14pt}{20pt}\\selectfont
        #{@content}
        \\end{document}
    TEMPLATE
  end

  %i[tex pdf svg html].each do |extension|
    define_method "#{extension}_path" do
      path_for(extension: extension)
    end
  end

  private def path_for(extension:)
    "#{tmp_directory}/#{name}.#{extension}"
  end

  private def tmp_directory
    @tmp_directory ||= FileUtils
      .mkdir_p(File.expand_path("./../../../tmp/tex_elements/#{@template_name.gsub('/', '-')}", __FILE__))
      .first
  end

  private def tex_macros
    %w[
        \newcommand{\cats}[1]{\mathcal{#1}}
        \newcommand{\catl}[1]{\mathbf{#1}}
        \newcommand{\set}[1]{\mathbb{#1}}
        \newcommand{\id}[1]{\mathbf{id}_{#1}}
        \newcommand{\functor}[1]{\mathbf{#1}}
        \newcommand{\bold}[1]{\bf #1}
      ]
  end
end
