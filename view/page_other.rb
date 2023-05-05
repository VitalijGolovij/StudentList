# frozen_string_literal: true
require_relative 'page'
require 'fox16'
include Fox
class Page_other < Page
  def initialize(parent)
    super(parent, 'other empty window')

    hFrame1 = FXHorizontalFrame.new(self)
    chrLabel = FXLabel.new(hFrame1, "oiosnnni")
    chrTextField = FXTextField.new(hFrame1, 4)

    hFrame2 = FXHorizontalFrame.new(self)
    @includeSpecialCharacters = false
    specialChrsCheck = FXCheckButton.new(hFrame2, "Inclunkjsnjknwjjw ")

    vFrame1 = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)
    textArea = FXText.new(vFrame1, :opts => LAYOUT_FILL | TEXT_READONLY | TEXT_WORDWRAP)
    hFrame3 = FXHorizontalFrame.new(vFrame1)
    generateButton = FXButton.new(hFrame3, "Generate")
    copyButton = FXButton.new(hFrame3, "Copkwinosnoinsoinnard")
  end
end
