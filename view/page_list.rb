# frozen_string_literal: true

class Page_list
  def initialize(page_list)
    @pages = page_list
  end

  def add_page(page)
    @pages << page
  end

  #ubrat' potom
  def remove_page(page)
    @pages.delete(page)
  end

  def each_page
    @pages.each  {|page| yield page}
  end
end
