# frozen_string_literal: true
require_relative 'student_window_controller'

class Edit_student_controller < Student_window_controller
  def initialize(student)
    @view = nil
    @student = student
  end

  def view=(view)
    super
    set_textfields
  end

  def accept_student
    if fields_valid?
      new_student = Student.new(get_student_hash)
      @view.owner.controller.student_list.replace_by_id(@student.id, new_student)
      @view.owner.controller.refresh_data
      @view.close
    else
      @view.ok_button.state = STATE_DOWN
    end
  end

  protected
  def set_textfields
    @view.set_name_text(@student.name)
    @view.set_surname_text(@student.surname)
    @view.set_patronymic_text(@student.patronymic)
    @view.set_git_text(@student.git)
    @view.set_phone_text(@student.phone)
    @view.set_mail_text(@student.mail)
    @view.set_telegram_text(@student.telegram)
  end
end
