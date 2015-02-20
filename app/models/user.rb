class User < ActiveRecord::Base
  rolify
  belongs_to :jurisdiction
  has_many :formularies
  after_create :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :timeout_in => 15.minutes

  def self.users_from_jurisdiction(jurisdiction_id)
    Array.new.tap do |a|
    users = User.select("id").where("jurisdiction_id = ?", jurisdiction_id)
    users.each {|u| a << u.id }
    end
  end

  private
  def default_role
    User.last().add_role :jurisdictional
  end

end
