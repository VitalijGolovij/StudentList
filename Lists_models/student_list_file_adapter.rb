# frozen_string_literal: true
require_relative 'student_list_data_worker'
require_relative 'student_list_file'

class Student_list_file_adapter < Student_list_data_worker
  public_class_method :new

  def initialize(file_worker, file_path)
    @file_path = file_path
    @student_list_file = Student_list_file.new(file_worker)
    @student_list_file.read_from_file(@file_path)
  end

  def get_student_by_id(id)
    @student_list_file.read_from_file(@file_path)
    @student_list_file.get_student_by_id(id.to_i)
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    @student_list_file.read_from_file(@file_path)
    @student_list_file.get_k_n_student_short_list(k,n,data_list)
  end

  def replace_by_id(id, student)
    @student_list_file.read_from_file(@file_path)
    @student_list_file.replace_by_id(id.to_i, student)
    @student_list_file.write_to_file(@file_path)
  end

  def insert_student(student)
    @student_list_file.read_from_file(@file_path)
    @student_list_file.insert_student(student)
    @student_list_file.write_to_file(@file_path)
  end

  def drop_by_id(id)
    @student_list_file.read_from_file(@file_path)
    @student_list_file.drop_by_id(id.to_i)
    @student_list_file.write_to_file(@file_path)
  end

  def get_students_count
    @student_list_file.read_from_file(@file_path)
    @student_list_file.get_student_count
  end
end
