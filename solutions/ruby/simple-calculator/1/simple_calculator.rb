class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError.new unless first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)
    raise UnsupportedOperation.new unless ALLOWED_OPERATIONS.include?(operation)
    
    to_calculate = "#{first_operand} #{operation} #{second_operand}"
    result = eval(to_calculate)

    "#{to_calculate} = #{result}"

  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end
end
