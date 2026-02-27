class ZebraPuzzle
  NATIONALITIES = %i[Englishman Spaniard Ukrainian Norwegian Japanese].freeze
  COLORS = %i[red green ivory yellow blue].freeze
  PETS = %i[dog snail fox horse zebra].freeze
  DRINKS = %i[coffee tea milk orange_juice water].freeze
  ACTIVITIES = %i[dancing painting reading football chess].freeze

  POSITIONS = (1..5).to_a.freeze

  def self.water_drinker
    new.solve.then { |n, _, d, _, _| n.key(d[:water]).to_s }
  end

  def self.zebra_owner
    new.solve.then { |n, _, _, p, _| n.key(p[:zebra]).to_s }
  end

  def solve
    nationalities = permutations(NATIONALITIES).select { |n| n[:Norwegian] == 1 }
    colors = permutations(COLORS).select { |c| c[:green] == c[:ivory] + 1 }
    drinks = permutations(DRINKS).select { |d| d[:milk] == 3 }

    solutions = nationalities.map { |n| [n] }

    solutions = combine(solutions, colors) { |n, c|
      n[:Englishman] == c[:red] &&
      (n[:Norwegian] - c[:blue]).abs == 1
    }

    solutions = combine(solutions, drinks) { |n, c, d|
      c[:green] == d[:coffee] &&
      n[:Ukrainian] == d[:tea]
    }

    solutions = combine(solutions, permutations(PETS)) { |n, c, d, p|
      n[:Spaniard] == p[:dog] &&
      (c[:yellow] - p[:horse]).abs == 1
    }

    solutions = combine(solutions, permutations(ACTIVITIES)) { |n, c, d, p, a|
      c[:yellow] == a[:painting] &&
      a[:dancing] == p[:snail] &&
      a[:football] == d[:orange_juice] &&
      (a[:reading] - p[:fox]).abs == 1 &&
      n[:Japanese] == a[:chess]
    }

    solutions.first
  end

  private

  def permutations(keys)
    POSITIONS.permutation.map { |positions| keys.zip(positions).to_h }
  end

  def combine(solutions, perms, &constraint)
    solutions.lazy.flat_map do |solution|
      perms
        .select { |perm| constraint.call(*solution, perm) }
        .map { |perm| [*solution, perm] }
    end
  end
end
