class ImageConverter
  delegate :tex_path, :pdf_path, :svg_path, :html_path, to: :@tex_element
  delegate :content, to: :@tex_element, prefix: :tex

  def initialize(tex_element)
    @tex_element = tex_element
  end

  def image_tag
    @image_tag ||= "<img src=\"data:image/svg+xml;base64,#{Base64.strict_encode64(create_image)}\" />"
  end

  private def create_image
    return File.read(html_path) if File.exist?(html_path)

    create_tex_file
    convert_tex_to_pdf
    convert_pdf_to_svg
    convert_svg_to_html
    File.read(html_path)
  end

  private def create_tex_file
    File.write(tex_path, @tex_element.full_content)
  end

  private def convert_tex_to_pdf
    with_convert_log(tex_path, pdf_path) do
      `cd #{tex_path.split('/')[0..-2].join('/')} && lualatex --halt-on-error #{tex_path} #{pdf_path}`
    end
  end

  private def convert_pdf_to_svg
    with_convert_log(pdf_path, svg_path) { `pdf2svg #{pdf_path} #{svg_path}` }
  end

  private def convert_svg_to_html
    with_convert_log(svg_path, html_path) do
      File.write(html_path, InlineSvg::TransformPipeline.generate_html_from(File.new(svg_path), {}))
    end
  end

  private def with_convert_log(before_path, after_path)
    puts "Converting: #{before_path.split('/').last(2).join('/')}"
    result = yield
    puts "Converted:  #{after_path.split('/').last(2).join('/')}"
    result
  end
end
