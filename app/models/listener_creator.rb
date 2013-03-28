class ListenerCreator
  def initialize(email)
    @listener = Listener.where(email: email).first_or_create!
  end
  def listen_to(username)
    @user = User.where(username: username).first_or_initialize
    @listener.users << @user
  end
end
