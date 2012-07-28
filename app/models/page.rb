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
    self.description = RedCloth.new(self.raw_description).to_html
    self.content     = RedCloth.new(self.raw_content).to_html
  end
end