class ApplyPolicy < ApplicationPolicy

  def index?
    record.user == user
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def change_status?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
