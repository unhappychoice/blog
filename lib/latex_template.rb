require_relative './latex_template/image_converter'
require_relative './latex_template/tex_element'

class LatexTemplate < Tilt::Template
  def prepare
    @tex_content = data.scan(%r{<tex>(.*?)</tex>}m).map(&:first)
  end

  def evaluate(_scope, locals, &block)
    template_name = locals[:current_path].split('.').first

    @tex_content
      .map(&TexElement.method(:new).curry(2).call(template_name))
      .map(&ImageConverter.method(:new))
      .inject(data) { |acc, converter| acc.gsub("<tex>#{converter.tex_content}</tex>", converter.image_tag) }
  end
end
