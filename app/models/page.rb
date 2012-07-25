class Page < ActiveRecord::Base
  attr_accessible :title, :raw_content, :raw_description

  before_save :prepare_content

  # VALIDATIONS
  validates :title,       :presence => true
  validates :raw_content, :presence => true

  private

  def prepare_content
    self.content = "<p>#{self.raw_content}</p>"
  end
end