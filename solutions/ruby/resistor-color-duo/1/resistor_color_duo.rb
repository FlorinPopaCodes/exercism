=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

class ResistorColorDuo
    COLORS = %w{black brown red orange yellow green blue violet grey white}
    def self.value(color_array)
        color_array.take(2).map { |color| COLORS.index(color) }.join.to_i
    end
end