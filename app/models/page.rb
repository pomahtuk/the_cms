class Page < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  attr_accessible :title, :raw_content, :raw_description
  before_save :prepare_content

  # VALIDATIONS
  validates :title,       :presence => true
  validates :raw_content, :presence => true

  # RELATIONS
  belongs_to :user

  private

  def prepare_content
    self.description = "<p><b>#{self.raw_description}</b></p>"
    self.content     = "<p>#{self.raw_content}</p>"
  end
end