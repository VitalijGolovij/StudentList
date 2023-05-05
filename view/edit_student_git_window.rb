# frozen_string_literal: true
require_relative '../controller/edit_student_controller'
require 'fox16'
include Fox

class Edit_student_git_window < InputStudentWindow
  def initialize(p)
    super(p)
  end

  protected
  def block_fields
    @name_field.textStyle = TEXTFIELD_READONLY
    @surname_field.textStyle = TEXTFIELD_READONLY
    @patronymic_field.textStyle = TEXTFIELD_READONLY
    @phone_field.textStyle = TEXTFIELD_READONLY
    @mail_field.textStyle = TEXTFIELD_READONLY
    @telegram_field.textStyle = TEXTFIELD_READONLY
  end

  def set_color
    @name_field.backColor = Fox.FXRGB( 47,  79,  79)
    @surname_field.backColor = Fox.FXRGB( 47,  79,  79)
    @patronymic_field.backColor = Fox.FXRGB( 47,  79,  79)
    @phone_field.backColor = Fox.FXRGB( 47,  79,  79)
    @mail_field.backColor = Fox.FXRGB( 47,  79,  79)
    @telegram_field.backColor = Fox.FXRGB( 47,  79,  79)
  end
end
