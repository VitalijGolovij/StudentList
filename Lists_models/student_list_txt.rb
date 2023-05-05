# frozen_string_literal: true
require_relative 'student_list_file'
require_relative '../Student_models/Student'
class Student_list_txt < Student_list_file_worker
  public_class_method :new

  def read_from_file(file_path)
    student_list = []

    if File.exist?(file_path)
      file = File.new(file_path, "r:UTF-8")
      lines = file.read.to_s.strip
      cur_str = ""
      lines.each_char do |char|
        cur_str += char
        if char == '}'
          student_list << (Student.from_json_str(cur_str))
          cur_str = ""
        end
      end
      file.close
    else
      raise ArgumentError, "file in path '#{file_path}' not found"
    end

    student_list
  end

  def write_to_file(file_path, hash_list)
    file = File.new(file_path, 'w')
    hash_list.each do |student_hash|
      file.write("#{student_hash}\n")
    end
    file.close
  end

end
