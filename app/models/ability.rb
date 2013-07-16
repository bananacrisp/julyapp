class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :view, :weekly if user.has_role? :weekly
      can :view, :fortnightly if user.has_role? :fortnightly
      can :view, :monthly if user.has_role? :monthly
      can :view, :monthly_switch if user.has_role? :monthly_switch
      can :view, :fortnightly_switch if user.has_role? :fortnightly_switch
    end
  end
end