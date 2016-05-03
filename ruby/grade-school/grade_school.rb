class School

  VERSION = 1

  def initialize
    @enrollment = Hash.new
  end

  def to_h
    @enrollment.map do |pair|
       [ pair[0], pair[1].sort ]
    end.sort.to_h
  end

  def add(student_name, student_grade)
    if @enrollment[student_grade]
      @enrollment[student_grade] << student_name
    else
      @enrollment[student_grade] = [student_name]
    end
  end

  def grade(level)
    if @enrollment.keys.include?(level)
      @enrollment[level].sort
    else
      []
    end
  end
end
