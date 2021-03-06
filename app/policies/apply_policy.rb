class ApplyPolicy < ApplicationPolicy

  def index?
    record.user == user
  end

  def create?
    return true
  end

  def show?
    record.user == user
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

  def accept?
    record.user == user
  end

  def decline?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
