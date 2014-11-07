class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user
    if user.has_role? :admin
      can :manage, User
      can :manage, Formulary
    elsif user.has_role? :jurisdictional
      can :capture_formulary
      can :manage, Formulary
    elsif user.has_role? :state
      can :view_state_results #As Formulary is a REST resource i can erase this
      can :read, Formulary
    elsif user.has_role? :institutional
        can :view_institutional_results
    elsif user.has_role? :federal
        can :view_national_results
    else
      can :read, Formulary
    end
  end
end
