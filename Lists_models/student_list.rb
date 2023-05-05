# frozen_string_literal: true

class Student_list
  def initialize(data_worker)
    @data_worker = data_worker
  end

  def get_student_by_id(id)
    @data_worker.get_student_by_id(id)
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    @data_worker.get_k_n_student_short_list(k,n,data_list)
  end

  def insert_student(student)
    @data_worker.insert_student(student)
  end

  def replace_by_id(id, student)
    @data_worker.replace_by_id(id, student)
  end

  def drop_by_id(id)
    @data_worker.drop_by_id(id)
  end

  def get_students_count
    @data_worker.get_students_count
  end
end
