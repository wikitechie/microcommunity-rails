class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :wikipages
  has_many :events
  has_many :posts

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :memberships
  has_many :groups, :through => :memberships, :source => :group

  has_one :profile

  has_many :attendances

  acts_as_followable
  acts_as_follower

  def self.current_user
    @@current_user
  end

  def self.current_user= c
    @@current_user = c
  end



end

