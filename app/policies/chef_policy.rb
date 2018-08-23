class ChefPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(restaurant: user)
    end
  end

  def edit?
    record.restaurant == user
  end
end
