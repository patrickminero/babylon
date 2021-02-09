class ProviderPolicy < ApplicationPolicy
  def index?
    return true
  end

  def all?
    return true
  end

  def show?
    return true if !user.nil?
  end

  def new?
    @user.provider == false
  end

  def create?
    return true if !user.nil?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
