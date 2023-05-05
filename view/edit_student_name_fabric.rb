# frozen_string_literal: true
require_relative 'input_student_window_fabric'
require_relative 'edit_student_name_window'

class Edit_student_name_fabric < Input_student_window_fabric

  def self.create(parent, student)
    controller = Edit_student_controller.new(student)
    view = Edit_student_name_window.new(parent)

    view.controller = controller
    controller.view = view

    return view
  end
end
