class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user
      can :create, :rubygems
      can :create, :rubygem_versions, user_id: user.id
    end
  end
end
