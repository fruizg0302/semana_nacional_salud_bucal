class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :do_all
    elsif user.has_role? :jurisdictional
      can :capture_formulary
    elsif user.has_role? :state
      can :view_state_formularies
    elsif user.has_role? :institutional
        can :capture_institutional_formularies
    else
      can :guest_view
    end
end
