class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(restaurant: user)
    end
  end

  def create?
    true
  end

  def show?
    record.restaurant == user
  end

  def confirm?
    show?
  end

  def cancel?
    show?
  end

end
