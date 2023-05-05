# frozen_string_literal: true

class Data_list
  attr_reader :list
  def initialize(objects_list)
    self.list = objects_list
    @selected = []
  end

  def select(number)
    raise ArgumentError, "arg 'number' not Integer" if number.class != Integer
    raise ArgumentError, "arg 'number' must be greater than zero" if number < 0
    raise ArgumentError, "index #{number} out of range" if number > @list.size - 1

    @selected << number unless @selected.include?(number)
  end

  def [](other)
    self.list[other]
  end

  def get_selected
    selected_student_id = []
    @selected.each{ |selected_number| selected_student_id << @list[selected_number].id }
    selected_student_id
  end

  def list=(other)
    raise ArgumentError, "arg 'objects_list' must be Array" if other.class != Array
    @list = other
  end

  #основной метод, возвращающий Data_table
  def get_data
    Data_table.new(fill_table(@list))
  end

  protected
  #метод шаблона 1 - вернуть имена столбцов таблицы
  def get_names
    []
  end

  #метод шаблона 2 - заполнить строку для таблицы
  def fill_row(object)
    []
  end

  #метод шаблона 3 - заполнить таблицу
  def fill_table(objects_list)
    table = []
    objects_list.each{ |object| table << fill_row(object) }
    table
  end
end