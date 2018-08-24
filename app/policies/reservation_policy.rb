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

  def decline?
    show?
  end

  def cancel?
    show?
  end

  def update?
    show?
  end

end
