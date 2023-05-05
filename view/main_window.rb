
# frozen_string_literal: true
require 'fox16'
require_relative 'page_list_view'
require_relative 'page_view'
require_relative 'page_list'
require_relative 'page_students'
require_relative 'page_other'
include Fox

class Main_window < FXMainWindow
  def initialize(app)
    super(app, "Student Book", :width => 1200, :height => 600)
    add_menu_bar
    @splitter = FXSplitter.new(self, :opts => SPLITTER_HORIZONTAL|LAYOUT_FILL)

    @switcher = FXSwitcher.new(@splitter, :opts => LAYOUT_FILL)

    @pages_list = [
      Page_students.new(@switcher),
      Page_other.new(@switcher)
    ]
    @page_list_view = Page_list_view.new(@splitter, LAYOUT_FILL_Y|LAYOUT_SIDE_LEFT, @pages_list)
    @switcher.connect(SEL_UPDATE) do
      @switcher.current = @page_list_view.currentItem
    end
    @page_list_view.switcher = @switcher
    @page_view = Page_view.new(@switcher)
  end

  def add_menu_bar
    menu_bar = FXMenuBar.new(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)
    file_menu = FXMenuPane.new(self)
    FXMenuTitle.new(menu_bar, "File", :popupMenu => file_menu)
    import_cmd = FXMenuCommand.new(file_menu, "Import..." )
    import_cmd.connect(SEL_COMMAND) do
      dialog = FXFileDialog.new(self, "Import Photos" )
      dialog.selectMode = SELECTFILE_MULTIPLE
      dialog.patternList = ["Source (*.json, *.yaml, *.txt)" ]
      if dialog.execute != 0
        import_students(dialog.filenames)
      end
    end
    exit_cmd = FXMenuCommand.new(file_menu, "Exit" )
    exit_cmd.connect(SEL_COMMAND) do
      exit
    end
  end

  def import_students(filenames)

  end

  def current_page_view
    @switcher.childAtIndex(@switcher.current)
  end

  def current_page
    current_page_view.page
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end
