class GrinderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if false #user&.admin?
        scope.all
      else
        scope.where(owner_id: user)
      end
    end
  end

  def index?
    true
  end

  def show?
    owner?
  end

  def create?
    true
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    return false unless record.is_a? Grinder

    record.owner == user
  end
end
