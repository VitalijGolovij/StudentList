# frozen_string_literal: true
require_relative 'input_student_window_fabric'
require_relative 'edit_student_git_window'
require_relative '../controller/edit_student_controller'

class Edit_student_contacts_fabric < Input_student_window_fabric

  def self.create(parent, student)
    controller = Edit_student_controller.new(student)
    view = Edit_student_contacts_window.new(parent)

    view.controller = controller
    controller.view = view

    view
  end
end
