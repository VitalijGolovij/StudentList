# frozen_string_literal: true
require_relative 'input_student_window_fabric'
require_relative 'add_student_window'
require_relative '../controller/add_student_controller'

class Add_student_fabric < Input_student_window_fabric

  def self.create(parent)
    controller = Add_student_controller.new
    view = Add_student_window.new(parent)
    view.controller = controller
    controller.view = view
    return view
  end
end