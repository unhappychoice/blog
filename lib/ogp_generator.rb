require 'rmagick'

class OgpGenerator
  def self.generate_ogp_image(title, output_path)
    # ベース画像の読み込み (仮のパス)
    # 実際には適切なベース画像を準備してください
    base_image_path = File.expand_path('../../source/images/ogp_base.png', __FILE__)
    unless File.exist?(base_image_path)
      # ベース画像がない場合は、一時的に白い画像を生成
      base_image = Magick::Image.new(1200, 630) { |image| image.background_color = 'white' }
      base_image.write(base_image_path)
    end

    image = Magick::Image.read(base_image_path).first

    draw = Magick::Draw.new
    draw.font = "Noto-Sans-CJK-JP-Bold" # フォントは環境に合わせて変更してください
    draw.pointsize = 60
    draw.fill = "#3d3d3d"
    draw.gravity = Magick::NorthWestGravity # 描画の基準点を左上に変更

    max_width = 960 # 1080 - 120
    line_height = 60 + 20 # 行の高さ (適宜調整)
    current_y = 100 # Y座標の開始位置

    wrapped_lines = []
    current_line = ""

    title.each_char do |char|
      test_line = current_line + char
      metrics = draw.get_type_metrics(image, test_line)
      if metrics.width > max_width
        wrapped_lines << current_line
        current_line = char
      else
        current_line = test_line
      end
    end
    wrapped_lines << current_line unless current_line.empty?

    wrapped_lines.each_with_index do |line, index|
      draw.annotate(image, 0, 0, 110, current_y + (line_height * index), line)
    end

    # 画像の保存
    image.write(output_path)
    puts "Generated OGP image: #{output_path}"
  end
end

# テスト実行
# OgpGenerator.generate_ogp_image("テストタイトル", File.expand_path('../../source/images/test_ogp.png', __FILE__))
