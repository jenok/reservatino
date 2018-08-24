class Customer::ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(customer: user)
    end
  end

  def create?
    true
  end

  def show?
    record.restaurant == user
  end

  def cancel?
    true
  end


end
