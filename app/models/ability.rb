class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :do_all
    elsif user.has_role? :jurisdictional
      can :capture_formulary
    elsif user.has_role? :state
      can :view_state_results
    elsif user.has_role? :institutional
        can :view_institutional_results
    elsif user.has_role? :federal
        can :view_national_results
    else
      can :guest_view
    end
end
