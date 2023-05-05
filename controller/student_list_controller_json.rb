# frozen_string_literal: true
require_relative 'student_list_controller'
require 'yaml'
require_relative '../Lists_models/student_list_db'

class Student_list_controller_json < Student_list_controller

  protected def set_src_controller
    @student_list = Student_list.new(Student_list_file_adapter.new(Student_list_JSON.new, 'result_files/input.json'))
  end
end
