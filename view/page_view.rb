# frozen_string_literal: true
require 'fox16'
include Fox
class Page_view < FXMatrix
  def initialize(parent)
    super(parent, :opts => LAYOUT_FILL)

    hFrame1 = FXHorizontalFrame.new(self)
    chrLabel = FXLabel.new(hFrame1, "Number of characters in password:")
    chrTextField = FXTextField.new(hFrame1, 4)

    hFrame2 = FXHorizontalFrame.new(self)
    @includeSpecialCharacters = false
    specialChrsCheck = FXCheckButton.new(hFrame2, "Include special chars in pass")

    vFrame1 = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)
    textArea = FXText.new(vFrame1, :opts => LAYOUT_FILL | TEXT_READONLY | TEXT_WORDWRAP)
    hFrame3 = FXHorizontalFrame.new(vFrame1)
    generateButton = FXButton.new(hFrame3, "Generate")
    copyButton = FXButton.new(hFrame3, "Copy to clipboard")
  end
end
