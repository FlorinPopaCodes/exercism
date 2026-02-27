class Microwave
    def initialize(input)
        @seconds = input % 100
        @minutes = input / 100

        if @seconds > 59
            @minutes += @seconds / 60
            @seconds = @seconds % 60
        end
    end

    def timer
        "%.2d:%.2d" % [@minutes, @seconds]
    end
end