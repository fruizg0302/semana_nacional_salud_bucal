class User < ActiveRecord::Base
  rolify
  belongs_to :jurisdiction
  has_many :formularies
  after_create :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.users_from_jurisdiction(jurisdiction_id)
    users_ids = []
    users = User.select("id").where("jurisdiction_id = ?", jurisdiction_id)
    users.each {|u| users_ids << u.id }
    users_ids
  end

  private
  def default_role
    User.last().add_role :jurisdictional
  end

end
