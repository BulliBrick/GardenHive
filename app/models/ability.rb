class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.user_role == "admin"
      can :manage, :all
    elsif user.user_role == "moderator"
      can :manage, Article
      can :manage, Comment
    else
      can :read, :all
      can :create, Article
      can :create, Comment
      can :update, Article, user_id: user.id
      can :destroy, Article, user_id: user.id
    end
  end
end
