class User < ActiveRecord::Base
  include Rolify::Roles
  # extend Rolify::Dynamic
  has_and_belongs_to_many :roles, :join_table => :users_roles
  
  authenticates_with_sorcery! 
  attr_accessible :email, :password, :password_confirmation, :username, :roles

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password  
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  
end
