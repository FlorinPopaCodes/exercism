=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament
  Score = Struct.new(:matches_played, :wins, :draws, :loses, :points)

  def self.tally(input)
    output_results(
      sort_results(
        read_data(input)
      )
    )
  end

  def self.read_data(input)
    results = Hash.new { |h,k| h[k] = Score.new(0, 0, 0, 0, 0) }
    matches = input.split("\n")

    matches.each do |match|
      home_team, away_team, match_result = match.split(";")

      results[home_team].matches_played += 1
      results[away_team].matches_played += 1

      if match_result == 'win'
        results[home_team].wins += 1
        results[home_team].points += 3

        results[away_team].loses += 1
      elsif match_result == 'loss'
        results[home_team].loses += 1

        results[away_team].wins += 1
        results[away_team].points += 3
      else
        results[home_team].draws += 1
        results[home_team].points += 1

        results[away_team].draws += 1
        results[away_team].points += 1
      end
    end

    results
  end

  def self.sort_results(results)
    results.sort_by do |item|
      [-item[1].points, item[0]]
    end
  end

  def self.output_results(results)
    output = <<~OUTPUT
    Team                           | MP |  W |  D |  L |  P
    OUTPUT

    results.each do |team, score|
      output += sprintf(<<~OUTPUT, team, *score)
        %-30s | %2d | %2d | %2d | %2d | %2d
      OUTPUT
    end

    output
  end
end
