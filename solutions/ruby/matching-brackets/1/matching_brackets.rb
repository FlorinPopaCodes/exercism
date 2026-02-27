class Brackets
  INSERSE_PAIRS = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }.freeze

  def self.paired?(input)
    stack = []

    input
      .chars
      .each do |c|
        case c
        when '[', '{', '('
          stack.push(c)
        when ']', '}', ')'
          return false if stack.last != INSERSE_PAIRS[c]

          stack.pop
        end
      end

    stack.empty?
  end
end
