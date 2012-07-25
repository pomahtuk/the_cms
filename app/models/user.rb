class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  validates :username,
    :presence => true,
    :length   => { :minimum => 4 }

  validates :email,
    :presence   => true,
    :uniqueness => true,
    :length     => { :minimum => 4 }
end
