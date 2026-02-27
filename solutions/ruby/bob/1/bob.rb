=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

class Bob
  def self.hey(remark)
    r = remark.strip

    case
    when question?(r) && shouting?(r)
      "Calm down, I know what I'm doing!"
    when question?(r)
      "Sure."
    when shouting?(r)
      "Whoa, chill out!"
    when silence?(r)
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  def self.shouting?(remark)
    remark.scan(/[A-Z]/).size > remark.scan(/[a-z]/).size
  end

  def self.question?(remark)
    remark.end_with?('?')
  end

  def self.silence?(remark)
    remark.empty?
  end
end
