class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can [:show, :following, :followers, :index, :send_message], User
      can [:edit, :details, :update], User, :user_id == user.id
      can [:create, :destroy], Relationship
      can :manage, Project
      can :manage, Issue
      can :manage, IssueCategory
      can :manage, TimeEntry
      can :manage, Attachment
      can :manage, Group
      can :manage, Member
      can :manage, Role
      can :manage, Milestone
      can :manage, Document
      can :manage, Phase
      can :manage, Activity
    end
  end
end


