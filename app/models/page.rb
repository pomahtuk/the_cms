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
    # DESCRIPTION preparation
    description = self.raw_description
    description = Sanitize.clean(description, Sanitize::Config::USER)
    # Your own preparator can be here
    description = RedCloth.new(description).to_html
    self.description = description
    
    # CONTENT preparation
    content = self.raw_content
    content = Sanitize.clean(content, Sanitize::Config::USER)
    # Your own preparator can be here
    content = RedCloth.new(content).to_html
    self.content = content

  end
end