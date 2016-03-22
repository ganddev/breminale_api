class LocationPolicy
attr_reader :user, :location

  def initialize(user, location)
    @user = user
    @location = location
  end

  def index?
    true
  end

  def show?
    @user == @location.user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @user == @location.user
  end

  def edit?
    update?
  end

  def destroy?
    @user == @location.user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end