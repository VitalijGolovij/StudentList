# frozen_string_literal: true
require_relative 'input_student_window_fabric'
require_relative '../controller/edit_student_controller'

class Edit_student_git_fabric < Input_student_window_fabric

  def self.create(parent, student)
    controller = Edit_student_controller.new(student)
    view = Edit_student_git_window.new(parent)

    controller.view = view
    view.controller = controller

    return view
  end
end
