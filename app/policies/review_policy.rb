class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(restaurant: user)
    end
  end

  def new?
    true
  end
end
