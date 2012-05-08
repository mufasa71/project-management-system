class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can [:show, :following, :followers], User
      can [:edit, :details, :update], User, :user_id == user.id
      can [:create, :destroy], Relationship
      can :manage, Project
    end
  end
end


