# frozen_string_literal: true
require 'yaml'
require_relative '../Student_models/Student'

class Student_list_YAML < Student_list_file_worker
  public_class_method :new

  def read_from_file(file_path)
    student_list = []

    YAML.load(File.read(file_path)).each do |hash_for_student|
      student_list << Student.new(hash_for_student)
    end

    student_list
  end

  def write_to_file(file_path, hash_list)
    File.write(file_path, YAML.dump(hash_list))
  end

end
