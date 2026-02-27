=begin
Write your code for the 'Robot Name' exercise in this file. Make the tests in
`robot_name_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-name` directory.
=end

class Robot
  def initialize
    @name = @@name_range.pop
  end

  def name
    @name
  end

  def reset
    @@name_range.unshift(@name)
    @name = @@name_range.pop
  end

  def self.forget
    @@name_range = ('AA000'..'ZZ999').to_a.shuffle
  end
end
