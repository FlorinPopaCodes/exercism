=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end

class SpaceAge
  EARTH_YEARS = 31557600.0 # seconds
  MERCURY_YEARS = 0.2408467 # earth years (ey)
  VENUS_YEARS = 0.61519726 # ey
  MARS_YEARS = 1.8808158 # ey
  JUPITER_YEARS = 11.862615 # ey
  SATURN_YEARS = 29.447498 # ey
  URANUS_YEARS = 84.016846 # ey
  NEPTUNE_YEARS = 164.79132 # ey

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    @earth_years ||= @seconds / EARTH_YEARS
  end

  def on_mercury
    on_earth / MERCURY_YEARS
  end

  def on_venus
    on_earth / VENUS_YEARS
  end

  def on_mars
    on_earth / MARS_YEARS
  end

  def on_jupiter
    on_earth / JUPITER_YEARS
  end

  def on_saturn
    on_earth / SATURN_YEARS
  end

  def on_uranus
    on_earth / URANUS_YEARS
  end

  def on_neptune
    on_earth / NEPTUNE_YEARS
  end
end
