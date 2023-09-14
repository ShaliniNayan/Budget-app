class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Group do |group|
      group.user == user
    end

    can :update, Group do |group|
      group.user == user
    end

    can :destroy, Bill do |bill|
      bill.author == user
    end

    can :update, Bill do |bill|
      bill.author == user
    end

    can :create, Group
    can :create, Bill
  end
end
