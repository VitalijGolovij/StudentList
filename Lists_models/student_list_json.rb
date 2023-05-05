# frozen_string_literal: true
require_relative 'student_list_file_worker'
require_relative '../Student_models/Student'

class Student_list_JSON < Student_list_file_worker
  public_class_method :new

  def read_from_file(file_path)
    student_list = []

    JSON.load(File.open(file_path)).each do |hash_for_student|
      student_list << (Student.new(hash_for_student))
    end

    student_list
  end

  def write_to_file(file_path, hash_list)
    File.open(file_path,'w') do |file|
      JSON.dump(hash_list, file)
    end
  end

end
