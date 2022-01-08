class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, Recipe do |recipe|
        recipe.user == user || recipe.public
      end
    end

    can [:update, :destroy], Recipe do |recipe|
      recipe.user == user
    end

    can :read, Food
    can :destroy, Food do |food|
      food.user.id == user.id
    end
    can %i[create], :all

    # return unless user.present?

    # can :read, Recipe, public: true
    # can :manage, Recipe, user: user
    # can :manage, Food, user: user
    # can :manage, Inventory, user: user
    # can :read, Food
    # can :create, :all
  end
end
