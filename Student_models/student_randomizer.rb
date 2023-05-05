# frozen_string_literal: true
require_relative 'Student'

class Student_randomizer
  def initialize
    @alph_upper = ('А'..'Я').to_a
    @alph_lower = ('а'..'я').to_a
    @alph_lat_lower = ('a'..'z').to_a
    @digits = ('0'..'9').to_a
  end

  def generate_student
    init_hash = {"name":gen_name,"surname":gen_name,"patronymic":gen_name,
                 "git":gen_git,"mail":gen_mail,"phone":gen_phone,"telegram":gen_telegram}
    Student.new(init_hash)
  end

  protected
  def gen_name
    name = ''
    name += @alph_upper[rand(10)]
    name_lenght = rand(6) + 3
    1.upto(name_lenght).each do
      name += @alph_lower[rand(10)]
    end
    name
  end

  def gen_phone
    phone_code = ''
    phone_number = ''

    1.upto(3).each{phone_code += @digits[rand(10)]}
    1.upto(7).each{phone_number += @digits[rand(10)]}

    "+7(#{phone_code})#{phone_number}"
  end

  def gen_mail
    "#{gen_word}@#{gen_word}.com"
  end

  def gen_git
    "github.com/#{gen_word}"
  end

  def gen_telegram
    "@#{gen_word}"
  end

  def gen_word
    word = ''
    1.upto(rand(10) + 3).each{word += @alph_lat_lower[rand(10)]}
    word
  end
end