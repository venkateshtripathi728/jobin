class OrganizationPolicy < ApplicationPolicy
  def create?
    return true
  end
  
  def update?
    record.user == user
  end

  def createorfind?
    return true
  end
  
  def destroy?
    record.user == user
  end

end
