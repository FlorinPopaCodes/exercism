=begin
Write your code for the 'Grade School' exercise in this file. Make the tests in
`grade_school_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grade-school` directory.
=end

class School
  def initialize
    @students = Hash.new { [] }
  end

  def add(name, grade)
    @students[grade] <<= name
    @students[grade].sort!
  end

  def students(grade)
    @students[grade]
  end

  def students_by_grade
    @students.map { |grade, students|
      {
        grade: grade,
        students: students
      }
    }.sort_by { |i| i[:grade] }
  end
end
