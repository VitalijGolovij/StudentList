# frozen_string_literal: true
require_relative '../Student_models/Student'
require_relative 'student_window_controller'

class Add_student_controller < Student_window_controller

  def accept_student
    if fields_valid?
      @view.owner.controller.student_list.insert_student(Student.new(get_student_hash))
      @view.owner.controller.refresh_data
      @view.close
    else
      @view.ok_button.state = STATE_DOWN
    end
  end
end