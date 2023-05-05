# frozen_string_literal: true

class Student_window_controller
  def initialize
    @view = nil
  end

  def view=(view)
    @view = view
  end

  def accept_student

  end

  def change_button_state
    if fields_valid?
      @view.ok_button_up
    else
      @view.ok_button_down
    end
  end

  def fields_valid?
    return false unless Student.is_name?(@view.get_name_text)
    return false unless Student.is_name?(@view.get_surname_text)
    return false unless Student.is_name?(@view.get_patronymic_text)
    return false unless Student.is_git?(@view.get_git_text) or @view.get_git_text == ""
    return false unless Student.is_phone?(@view.get_phone_text) or @view.get_phone_text == ""
    return false unless Student.is_mail?(@view.get_mail_text) or @view.get_mail_text == ""
    return false unless Student.is_telegram?(@view.get_telegram_text) or @view.get_telegram_text == ""
    true
  end

  def get_student_hash
    {
      "name": @view.get_name_text,
      "surname": @view.get_surname_text,
      "patronymic": @view.get_patronymic_text,
      "git": @view.get_git_text == ''? nil : @view.get_git_text,
      "phone": @view.get_phone_text == ''? nil : @view.get_phone_text,
      "mail": @view.get_mail_text == ''? nil : @view.get_mail_text,
      "telegram": @view.get_telegram_text == ''? nil : @view.get_telegram_text
    }
  end
end
