# frozen_string_literal: true
require 'fox16'
include Fox
class Page_list_view < FXList
  attr_reader :page_list

  def initialize(parent, opts, page_list)
    super(parent, :opts => opts)
    @page_list = page_list
    @page_list.each do |page_name|
      add_page(page_name)
    end
  end

  def switcher=(sw)
    @switcher = sw
  end

  def add_page(page)
    appendItem(page.title)
    # Page_view.new(@switcher, page)
  end


end
