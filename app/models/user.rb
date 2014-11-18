class User < ActiveRecord::Base
  rolify
  belongs_to :jurisdiction
  has_many :formularies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.users_from_jurisdiction(jurisdiction_id)
    users_ids = []
    users = User.select("jurisdiction_id").where("jurisdiction_id = ?", jurisdiction_id)
    users.each {|u| users_ids << u.jurisdiction_id }
    users_ids
  end
end
