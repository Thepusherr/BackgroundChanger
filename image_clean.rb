require 'rmagick'
include Magick
require 'mini_magick'

#image = Magick::Image.read('cleaned_images/images.png').first
#image.clone.negate
#image = Image.new(image.columns, image.rows)
#image.fuzz = '20%'
#background_color = image.background_color
#image.paint_transparent(background_color)
#image.alpha(Magick::ActivateAlphaChannel)
#image.background_color = 'white'
#image.matte_reset!
#image.composite!(image, 1, 1, OverCompositeOp)
#image = image.composite(image, NorthWestGravity, 0, 0, OverCompositeOp)
#image.write('cleaned_images/images2.png')

# input_path = 'images/images.png'
# output_path = 'images/images_c.png'

# image = Image.read(input_path).first
# mask = image.clone.negate
# new_background = Image.new(image.columns, image.rows)
# new_background.background_color = 'white'
# new_background = new_background.matte_reset!
# result = new_background.composite(image, CenterGravity, OverCompositeOp)
# result.write('cleaned_images/rm2_images.png')

# def change_background(image_path, output_path, new_background_color = 'white', fuzz_factor = 20)
#   image = Image.read(image_path).first
#   background_color = image.pixel_color(0, 0)
#   fuzz = (QuantumRange * fuzz_factor / 100.0).round
#   image.alpha(ActivateAlphaChannel)
#   new_background = Image.new(image.columns, image.rows)
#   new_background.background_color = new_background_color
#   new_background.matte_reset!
#   result = new_background.composite(image, CenterGravity, OverCompositeOp)
#   result.write(output_path)
# end

# change_background(input_path, 'cleaned_images/rm3_images.png', 'white', 20)


# image = MiniMagick::Image.open(input_path)
# image.combine_options do |c|
#   c.fuzz "20%"
#   c.background "white"
#   c.transparent "white"
# end
# new_background = MiniMagick::Image.open(input_path)
# new_background.combine_options do |c|
#   c.alpha "remove" 
#   c.background "white"
#   c.flatten
# end
# new_background.write("cleaned_images/mm1_images.png")

# convert images.png -bordercolor white -border 1x1 -matte -fill none -fuzz 20% -draw 'matte 1,1 floodfill' -shave 1x1 white_floodfill.png
# composite  -compose Dst_Over -tile pattern:checkerboard white_floodfill.png white_floodfill_check.png
# convert white_floodfill.png -background white -flatten white_floodfill_check2.png


# MiniMagick.composite do |composite|
  
#   composite << "cleaned_images/mm2_images.png"
#   composite.compose "Dst_Over"    # OverCompositeOp
#   composite << "-tile" << "pattern:checkerboard"
#   composite << "cleaned_images/mm3_images.png"
# end

MiniMagick.mogrify do |mogrify|
  mogrify.merge! ["-bordercolor", "white", "-border", "1x1", "-matte", "-fill", "none", "-fuzz", "20%", "-draw", "matte 1,1 floodfill", "-shave", "1x1", "-background", "white", "-flatten"]
  mogrify << "cleaned_images/*"
end


