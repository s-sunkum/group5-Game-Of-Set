require "colorize"
=begin
Card class represents one singular card. The card includes four attributes.
number -> How many shapes are displayed on the card (1,2,3)
shape -> What type of shape is on the card (Diamond, Squiggle, Oval)
shading -> What type of shading is on the shape (Solid, Open, Striped)
color -> What color is the shape (Red,Green, Purple)
=end

class Card
    #Setup get methods for number, shape, shading and color
    attr_reader :number, :shape, :shading, :color

=begin
    Constructor method for card class.
    @param number
        How many shapes are displayed on the card (1,2,3)
    @param shape 
        What type of shape is on the card (Diamond, Squiggle, Oval)
    @param shading 
        What type of shading is on the shape (Solid, Open, Striped)
    @param color 
        What color is the shape (Red,Green, Purple)
=end
    def initialize(number,shape,shading,color)

        @number = number
        @shape = shape
        @shading = shading
        @color = color

    end


=begin
    Prints card attributes with additional ruby gem colorize outputing the text in specific color.
=end
    def to_s
        if @color == "Red"
            (@number + " " + @shape + " " + @shading + " " + @color + "\n").red
        elsif @color == "Purple"
            (@number + " " + @shape + " " + @shading + " " + @color + "\n").magenta
        else
            (@number + " " + @shape + " " + @shading + " " + @color + "\n").green
        end
    end

end