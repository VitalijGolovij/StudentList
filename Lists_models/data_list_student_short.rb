# frozen_string_literal: true
require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list
  attr_reader :names
  def initialize(objects_list)
    super
    @observers = []
    @names = get_names
  end

  #добавить наблюдателя
  def add_observer(observer)
    @observers << observer
  end

  #удалить наблюдателя
  def delete_observer(observer)
    @observers.delete(observer)
  end

  def list=(other)
    super
    notify
  end

  #реакция наблюдателей на изменения
  def notify
    if @observers
      @observers.each do |obs|
        obs.set_table_params(get_names, 20)
        obs.set_table_data(get_data)
      end
    end
  end

  protected
  #переопределили 1ый метод шаблона
  #заполнили названия столбцов таблицы
  def get_names
    %w[
      id
      name
      contact
      git
    ]
  end

  #переопреелили 2ой метод шаблона
  def fill_row(object)
    [
      # @list.index(object),
      object.id,
      object.name,
      object.contact,
      object.git
    ]
  end
end


