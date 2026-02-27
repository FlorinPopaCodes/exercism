class BaseConverter
    def self.convert(input_base, digits, output_base)
        raise ArgumentError if input_base <= 1
        raise ArgumentError if output_base <= 1
        raise ArgumentError if digits.any?(&:negative?)
        raise ArgumentError if digits.any? { |i| i >= input_base }

        return convert_to_decimal(input_base, digits) if output_base == 10
        return convert_from_decimal(output_base, digits) if input_base == 10

        convert_from_decimal(output_base, convert_to_decimal(input_base, digits))
    end

    def self.convert_to_decimal(input_base, digits)
        result = 0

        digits.reverse.each_with_index do |item, index|
            result += item * (input_base ** index)
        end

        result.digits.reverse
    end

    def self.convert_from_decimal(output_base, digits)
        result = []
        number = digits.join.to_i

        while number > 0 do
            number, rem = number.divmod(output_base)
            result.insert(0, rem)
        end

        result = [0] if result.empty?

        result
    end
end