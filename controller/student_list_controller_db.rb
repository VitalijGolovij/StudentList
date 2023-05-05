# frozen_string_literal: true
require_relative 'student_list_controller'
require_relative '../Lists_models/student_list_db'

class Student_list_controller_db < Student_list_controller

  protected def set_src_controller
    @student_list = Student_list.new(Student_list_DB.new(YAML.load(File.open('database/config/connect_db_hash.yaml'))))
  end
end