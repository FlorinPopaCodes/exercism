=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end
class ResistorColorTrio
  COLOR_CODE = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }
  def initialize(colors)
    raise ArgumentError.new if (colors - COLOR_CODE.keys).size > 0
    
    @colors = colors
  end

  def leading_value
    COLOR_CODE[@colors[0]] * 10 + COLOR_CODE[@colors[1]] 
  end

  def zeroes
    (10 ** COLOR_CODE[@colors[2]]).to_s[1..-1]
  end

  def label
    value = leading_value.to_s + zeroes

    if value[-3..-1] == '000'
      measure = 'kiloohms'
      value = value[0..-4]
    else
      measure = 'ohms'
    end
    
    "Resistor value: #{value} #{measure}"
  end
end