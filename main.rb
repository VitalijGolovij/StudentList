require_relative 'view/main_window'
require 'fox16'
include Fox


FXApp.new do |app|
  begin
    Main_window.new(app)
    app.create
    app.run
  rescue Mysql2::Error::ConnectionError
    app.create
    FXMessageBox.error(app, MBOX_OK, 'Error', 'Can not connect to database')
  end
end