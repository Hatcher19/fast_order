class Ability
  include CanCan::Ability

  def initialize( user )

    # Handle the case where we don't have a current_user i.e. the user is a guest
    user ||= User.new

    if user.is? :admin
      can :manage, Order
      can :manage, User
    end
    if user.is? :operator
      can :create, Order
      can :read, Order, user_id: user.id
      can :manage, User, user_id: user.id
    end
  end
end