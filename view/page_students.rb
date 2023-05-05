# frozen_string_literal: true
require_relative 'page'
require_relative '../Lists_models/student_list_file'
require_relative '../Lists_models/student_list_json'
require_relative '../controller/student_list_controller'
require_relative 'add_student_fabric'
require_relative 'edit_student_name_fabric'
require_relative 'edit_student_git_fabric'
require_relative 'edit_student_contacts_fabric'
require 'fox16'
include Fox

class Page_students < Page
  attr_reader :parameters_fields, :table, :pages_count,
              :controller, :shortname_field, :add_button,
              :delete_button, :edit_button, :edit_git_button,
              :edit_name_button, :edit_contact_button
  def initialize(parent)
    super(parent, 'students list')
    @parameters_fields = Hash.new
    main_frame = FXHorizontalFrame.new(self, :opts => LAYOUT_FILL)
    make_filter_area(main_frame)
    make_table_area(main_frame)
    make_manage_buttons(main_frame)
    reset_buttons

    @controller = Student_list_controller.new(self)
    @controller.refresh_data
  end

  def set_table_data(data_table)
    (0..data_table.rows_count-1).each do |i|
      (0..data_table.columns_count-1).each do |j|
        @table.setItemText(i,j,data_table.get_elem(i,j).to_s)
      end
    end
  end

  def set_table_params(column_names, whole_entities_count)
    @table.setTableSize(whole_entities_count,column_names.size)

    0.upto(column_names.size - 1) do |i|
      @table.setColumnText(i, column_names[i])
      @table.setColumnWidth(i, 180)
    end
    @table.setColumnWidth(0,60)
  end

  def reset_buttons
    @edit_name_button.state = STATE_DOWN
    @edit_git_button.state = STATE_DOWN
    @edit_contact_button.state = STATE_DOWN
    @delete_button.state = STATE_DOWN
  end

  def get_id_selected_student(num_selected_row)
    @table.getItemText(num_selected_row,0)
  end

  def get_sel_start_row
    @table.selStartRow
  end

  def get_sel_end_row
    @table.selEndRow
  end

  def set_pages_counter(cur_page, pages_count)
    @pages_count.text = "#{cur_page}/#{pages_count}"
  end

  protected
  def add_student
    @controller.add_student(Add_student_fabric)
  end

  def edit_name
    if selected_one_row? and !selected_empty_row?
      @controller.edit_student(Edit_student_name_fabric)
    end
  end

  def edit_git
    if selected_one_row? and !selected_empty_row?
      @controller.edit_student(Edit_student_git_fabric)
    end
  end

  def edit_contact
    if selected_one_row? and !selected_empty_row?
      @controller.edit_student(Edit_student_contacts_fabric)
    end
  end

  def delete_student
    @controller.delete_student
  end

  def process_filters
    @controller.process_filters
  end

  def process_select_cell
    if @table.anythingSelected? and !selected_empty_row?
      @delete_button.state = STATE_UP
      if selected_one_row?
        @edit_git_button.state = STATE_UP
        @edit_name_button.state = STATE_UP
        @edit_contact_button.state = STATE_UP
      else
        @edit_git_button.state = STATE_DOWN
        @edit_name_button.state = STATE_DOWN
        @edit_contact_button.state = STATE_DOWN
      end
    else
      reset_buttons
    end
  end

  def next_page
    @controller.next_page
  end

  def prev_page
    @controller.prev_page
  end

  def selected_empty_row?
    first_selected = @table.selStartRow
    last_selected = @table.selEndRow

    (first_selected..last_selected).each do |selected_row|
      if @table.getItemText(selected_row,0) == ''
        return true
      end
    end
    false
  end

  def selected_one_row?
    if @table.anythingSelected? and @table.selEndRow - @table.selStartRow == 0
      true
    else
      false
    end
  end

  def make_filter_area(parent)
    v_frame_filter = FXVerticalFrame.new(parent)
    FXLabel.new(v_frame_filter, "shortname:")
    @shortname_field = FXTextField.new(v_frame_filter,15)
    @shortname_field.connect(SEL_CHANGED) do
      process_filters
    end
    make_parameter_filter(v_frame_filter, 'git')
    make_parameter_filter(v_frame_filter,'mail')
    make_parameter_filter(v_frame_filter,'phone')
    make_parameter_filter(v_frame_filter,'telegram')
  end

  def make_parameter_filter(parent, parameter_name)
    FXLabel.new(parent,"#{parameter_name}:")
    combo_box = FXComboBox.new(parent,1,:opts => COMBOBOX_STATIC|LAYOUT_LEFT)

    parametr_field = FXTextField.new(parent,15, :opts => LAYOUT_SIDE_LEFT)
    parametr_field.connect(SEL_CHANGED) do
      process_filters
    end
    parametr_field.disable

    combo_box.fillItems(['doesn\'t matter', 'yes', 'no'])
    combo_box.numVisible = 3
    combo_box.connect(SEL_COMMAND) do
      if combo_box.currentItem == 1
        parametr_field.enable
      else
        parametr_field.disable
      end
    end
    @parameters_fields[parameter_name] = parametr_field
  end

  def make_table_area(parent)
    v_frame_table = FXVerticalFrame.new(parent)
    table_packer = FXPacker.new(v_frame_table)
    @table = FXTable.new(table_packer, :opts => LAYOUT_EXPLICIT, :width => 701, :height => 422)
    @table.connect(SEL_SELECTED) do
      process_select_cell
    end
    buttons_packer = FXPacker.new(v_frame_table, :opts => LAYOUT_FILL)
    hframe = FXHorizontalFrame.new(buttons_packer,
                                   :opts => LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X)
    next_button = FXButton.new(hframe, ">" ,
                               :opts => BUTTON_NORMAL|LAYOUT_RIGHT)
    next_button.connect(SEL_COMMAND) do
      next_page
    end
    prev_button = FXButton.new(hframe, "<" ,
                               :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    prev_button.connect(SEL_COMMAND) do
      prev_page
    end
    @pages_count = FXLabel.new(hframe, "",
                              :opts=> LAYOUT_CENTER_X)
  end

  def make_manage_buttons(parent)
    v_frame = FXVerticalFrame.new(parent, :opts => LAYOUT_FILL | PACK_UNIFORM_WIDTH)
    @add_button = FXButton.new(v_frame, 'Add')
    @add_button.connect(SEL_COMMAND) do
      add_student
    end
    @edit_name_button = FXButton.new(v_frame, 'Edit name')
    @edit_name_button.connect(SEL_COMMAND) do
      edit_name
    end
    @edit_git_button = FXButton.new(v_frame, 'Edit git')
    @edit_git_button.connect(SEL_COMMAND) do
      edit_git
    end
    @edit_contact_button = FXButton.new(v_frame, 'Edit contact')
    @edit_contact_button.connect(SEL_COMMAND) do
      edit_contact
    end
    @delete_button = FXButton.new(v_frame, 'Delete')
    @delete_button.connect(SEL_COMMAND) do
      delete_student
    end
  end
end

