class NotificationApplyPolicy < ApplicationPolicy
  def index?
    record.user == user
  end

  def create?
    record.user == user
  end

  def change_read_apply?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
