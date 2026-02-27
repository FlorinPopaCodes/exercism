class Microwave
    def initialize(input)
        @minutes, @seconds = input.divmod(100)
        extra_minute, @seconds = @seconds.divmod(60)
        @minutes += extra_minute
    end

    def timer
        "%.2d:%.2d" % [@minutes, @seconds]
    end
end