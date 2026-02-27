=begin
Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
`run_length_encoding_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/run-length-encoding` directory.
=end

class RunLengthEncoding
  def self.encode(input)
    input
      .chars
      .slice_when { |a,b| a != b }
      .map { |e| "#{e.size > 1 ? e.size : ''}#{e[0]}" }
      .join
  end

  def self.decode(input)
    input
      .scan(/([0-9]{1,})?([A-z ]{1})/)
      .map { |n, e| e * (n.nil? ? 1 : n.to_i) }
      .join
  end
end
