class EventPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def index?
    true
  end

  def show?
    @user == @event.user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @user == @event.user
  end

  def edit?
    update?
  end

  def destroy?
    @user == @event.user
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