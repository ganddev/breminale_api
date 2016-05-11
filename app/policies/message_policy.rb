class MessagePolicy
  attr_reader :user, :message

  def initialize(user, message)
    @user = user
    @message = message
  end

  def index?
    true
  end

  def show?
    @user == @message.user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @user == @message.user
  end

  def edit?
    update?
  end

  def destroy?
    @user == @message.user
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