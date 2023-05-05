# frozen_string_literal: true
require 'fox16'
require_relative '../controller/add_student_controller'
require_relative '../controller/edit_student_controller'
include Fox
class InputStudentWindow < FXDialogBox
  attr_reader :ok_button, :name_field, :surname_field,
              :patronymic_field, :git_field, :phone_field,
              :mail_field, :telegram_field

  def initialize(p)
    super(p, 'Student')
    @controller = nil
    add_input_textfields
    add_terminating_buttons
    add_event_on_textfields
    block_fields
    set_color
  end

  def controller=(controller)
    @controller = controller
  end

  def ok_button_up
    @ok_button.state = STATE_UP
  end

  def ok_button_down
    @ok_button.state = STATE_DOWN
  end

  def get_name_text
    @name_field.text
  end

  def get_surname_text
    @surname_field.text
  end

  def get_patronymic_text
    @patronymic_field.text
  end

  def get_git_text
    @git_field.text
  end

  def get_phone_text
    @phone_field.text
  end

  def get_mail_text
    @mail_field.text
  end

  def get_telegram_text
    @telegram_field.text
  end

  def set_name_text(text)
    @name_field.text = text
  end

  def set_surname_text(text)
    @surname_field.text = text
  end

  def set_patronymic_text(text)
    @patronymic_field.text = text
  end

  def set_git_text(text)
    @git_field.text = text
  end

  def set_phone_text(text)
    @phone_field.text = text
  end

  def set_mail_text(text)
    @mail_field.text = text
  end

  def set_telegram_text(text)
    @telegram_field.text = text
  end

  protected
  def block_fields

  end

  def set_color

  end
  def add_terminating_buttons
    buttons = FXHorizontalFrame.new(self,
                                    :opts => LAYOUT_FILL_X|LAYOUT_SIDE_BOTTOM|PACK_UNIFORM_WIDTH)
    FXButton.new(buttons, "Cancel",
                 :target => self, :selector => FXDialogBox::ID_CANCEL,
                 :opts => BUTTON_NORMAL|LAYOUT_RIGHT)
    @ok_button = FXButton.new(buttons, "OK",
                 :opts => BUTTON_NORMAL|LAYOUT_RIGHT)
    @ok_button.connect(SEL_COMMAND) do
      @controller.accept_student

    end
    @ok_button.state = STATE_DOWN
  end

  def add_input_textfields

    matrix = FXMatrix.new(self, 2, :opts => MATRIX_BY_COLUMNS|LAYOUT_FILL)

    FXLabel.new(matrix, "name:")
    @name_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "surname:" )
    @surname_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "patronymic:" )
    @patronymic_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "git:" )
    @git_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "phone:" )
    @phone_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "mail:" )
    @mail_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "telegram:" )
    @telegram_field = FXTextField.new(matrix, 14)
  end

  def add_event_on_textfields
    @name_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @surname_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @patronymic_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @git_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @phone_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @mail_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @telegram_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end
  end
end
