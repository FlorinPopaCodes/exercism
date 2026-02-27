=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
    def initialize(input)
        if input > 99
            @seconds = input % 100
            @minutes = input / 100
        else
            @minutes = 0
            @seconds = input
        end

        if @seconds > 59
            @minutes += @seconds / 60
            @seconds = @seconds % 60
        end

    
    end


    def timer
        "%.2d:%.2d" % [@minutes, @seconds]
    end
end