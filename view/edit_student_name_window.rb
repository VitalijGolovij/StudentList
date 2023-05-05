# frozen_string_literal: true
require 'fox16'
include Fox

class Edit_student_name_window < InputStudentWindow
  def initialize(p)
    super(p)
  end

  protected
  def block_fields
    @git_field.textStyle = TEXTFIELD_READONLY
    @phone_field.textStyle = TEXTFIELD_READONLY
    @mail_field.textStyle = TEXTFIELD_READONLY
    @telegram_field.textStyle = TEXTFIELD_READONLY
  end


  def set_color
    @git_field.backColor = Fox.FXRGB( 47,  79,  79)
    @phone_field.backColor = Fox.FXRGB( 47,  79,  79)
    @mail_field.backColor = Fox.FXRGB( 47,  79,  79)
    @telegram_field.backColor = Fox.FXRGB( 47,  79,  79)
  end
end
