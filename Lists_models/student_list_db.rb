# frozen_string_literal: true
require_relative 'student_list_file'
require_relative '../database/class/database_worker'
require_relative 'data_list_student_short'
require_relative '../Student_models/Student_short'
require_relative 'student_list_data_worker'
require 'mysql2'
require 'yaml'

class Student_list_DB < Student_list_data_worker
  public_class_method :new
  def initialize(options = {})
    @db_worker = DatabaseWorker.get_instance(options)
  end

  def get_student_by_id(id)
    Student.new(@db_worker.select_by_id('students', id))
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    if data_list
      Data_list_student_short.new(data_list.list[k * (n - 1), k])
    else
      students_list = @db_worker.select('students').map{|student_hash| Student.new(student_hash)}
      raise ArgumentError, "overflow indexes" if students_list.size < k * (n - 1) + 1
      Data_list_student_short.new(students_list[k * (n - 1), k].map { |student| Student_short.from_student(student) } )
    end
  end

  def insert_student(student)
    student_hash = student.to_hash
    student_hash.delete(:id)
    @db_worker.insert('students', student_hash)
  end

  def replace_by_id(id, student)
    student_hash = student.to_hash
    student_hash.delete(:id)
    @db_worker.update_by_id('students', id, student_hash)
  end

  def drop_by_id(id)
    @db_worker.delete_by_id('students', id)
  end

  def get_students_count
    @db_worker.select('students').size
  end
end
