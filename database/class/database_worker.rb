# frozen_string_literal: true
require 'mysql2'
require 'yaml'
class DatabaseWorker
  private_class_method :new
  @instance = nil
  def initialize(options={})
    @db_client = Mysql2::Client.new(options)
  end

  def self.get_instance(options = nil)
    if options
      @instance ||= new(options)
    else
      @instance
    end
  end

  #вернуть результат запроса в виде Array
  protected def query_to_list(sql_query)
    _list = []
    @db_client.query(sql_query).each do |row|
      _list << row
    end
    _list
  end

  protected def values_to_str(select_values)
    select_values.map{|val| val = "'#{val}'"}.join(',')
  end

  protected def args_to_str(select_args)
    if select_args
      raise ArgumentError, "arg 'select_args' must be Array" unless select_args.class == Array
      args = select_args.join(',')
    else
      args = '*'
    end
  end

  def select( table_name, select_args = nil)
    query_to_list("SELECT #{args_to_str(select_args)} FROM #{table_name}")
  end

  def select_by_id(table_name, id, select_args = nil)
    query_to_list("SELECT #{args_to_str(select_args)} FROM #{table_name} WHERE id=#{id}")[0]
  end

  def insert(table_name, values_hash)
    raise ArgumentError, "arg 'values_hash' must be Hash" unless values_hash.class == Hash
    @db_client.query("INSERT INTO #{table_name}(#{args_to_str(values_hash.keys)}) VALUES
		(#{values_to_str(values_hash.values)})")
  end

  def delete_by_id(table_name, id)
    @db_client.query("DELETE FROM #{table_name} WHERE id = #{id}")
  end

  def update_by_id(table_name, id, args)
    keys = args.keys
    values_set = []
    keys.each{|key| values_set << "#{key} = '#{args[key]}'" }
    @db_client.query("UPDATE #{table_name} SET #{values_set.join(',')} WHERE id=#{id}")
  end

  def clone
    raise NoMethodError, "you can't clone Singleton class"
  end

  def dup
    raise NoMethodError, "you can't dub Singleton class"
  end

end

#проверить insert