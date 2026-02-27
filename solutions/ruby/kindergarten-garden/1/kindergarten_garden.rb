class Garden
  PLANTS = {
    'R' => :radishes,
    'C' => :clover,
    'G' => :grass,
    'V' => :violets,
  }.freeze

  STUDENTS = %w[
    Alice
    Bob
    Charlie
    David
    Eve
    Fred
    Ginny
    Harriet
    Ileana
    Joseph
    Kincaid
    Larry
  ].freeze

  def initialize(diagram, students = nil)
    @diagram = diagram.split("\n")
    @current_students = (students || STUDENTS).sort.map(&:downcase).map(&:to_sym)
  end

  def method_missing(student_name)
    index = @current_students.index(student_name)

    (@diagram[0][index * 2, 2] + @diagram[1][index * 2, 2])
      .chars
      .map do |plant_k|
        PLANTS[plant_k]
      end
  end
end
