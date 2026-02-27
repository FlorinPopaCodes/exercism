class Allergies
  NAMES = %w[
    eggs
    peanuts
    shellfish
    strawberries
    tomatoes
    chocolate
    pollen
    cats
  ].freeze

  def initialize(value)
    @alergies = value.to_s(2).reverse
  end

  def allergic_to?(alergen)
    @alergies[NAMES.index(alergen)] == '1'
  end

  def list
    results = []

    @alergies.chars.each_with_index do |active, index|
      results << NAMES[index] if active == '1' && index < NAMES.size
    end

    results
  end
end

