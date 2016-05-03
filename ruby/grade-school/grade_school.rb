class School

  VERSION = 1

  def initialize
    @enrollment = Hash.new([])
  end

  def to_h
    @enrollment.map do |k, v|
       [ k , v.sort ]
    end.sort.to_h
  end

  def add(student_name, student_grade)
    if @enrollment[student_grade] == []
      @enrollment[student_grade] = [student_name]
    else
      @enrollment[student_grade] << student_name
    end
  end

  def grade(level)
    @enrollment[level].sort
  end
end
