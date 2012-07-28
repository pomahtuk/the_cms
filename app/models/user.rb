class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body

  # VALIDATIONS
  validates :username,
    :presence => true,
    :length   => { :minimum => 4 }

  validates :email,
    :presence   => true,
    :uniqueness => true,
    :length     => { :minimum => 4 }

  # RELATIONS
  has_many :pages

end
