# frozen_string_literal: true
require_relative 'student_list_controller_yaml'
require_relative 'student_list_controller_json'
require_relative 'student_list_controller_db'

class Student_list_controller_factory
  private_class_method :new

  def self.create(parent, type)
    case type
    when 'JSON'
      puts 'отправляю json'
      return Student_list_controller_json.new(parent)
    when 'DB'
      return Student_list_controller_db.new(parent)
    when 'YAML'
      return Student_list_controller_yaml.new(parent)
    end
  end
end
