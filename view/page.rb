# frozen_string_literal: true
require 'fox16'
include Fox
class Page < FXPacker
  attr_reader :title

  def initialize(parent, title)
    super(parent, :opts => LAYOUT_FILL)
    @title = title
  end
end
