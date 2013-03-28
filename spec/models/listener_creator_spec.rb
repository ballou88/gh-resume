require 'spec_helper'

describe ListenerCreator do
  context "new listener" do
    it "creates a new listener" do
      expect{ListenerCreator.new("mikeballou@gmail.com")}.to change{Listener.count}.from(0).to(1)
    end
  end
  context "existing listener" do
    it "does not create a new listener" do
      Listener.create(email: "mikeballou@gmail.com")
      expect{ListenerCreator.new("mikeballou@gmail.com")}.not_to change{Listener.count}
    end
  end
  describe "#listen_to" do
    let(:listener_creator) {ListenerCreator.new("mikeballou@gmail.com")}
    let(:listener) { Listener.find_by_email("mikeballou@gmail.com")}

    context "listen to a new user" do
      it "should create a new user" do
        expect{listener_creator.listen_to("ballou88")}.to change{User.count}.from(0).to(1)
      end
      it "the user should be linked to the listener" do
        listener_creator.listen_to("ballou88")
        user = User.find_by_username("ballou88")
        expect(listener.users).to include(user)
      end
    end
    context "listen to an existing user" do
      before do
        @user = User.create(username: "ballou88")
      end

      it "should not create a new user" do
        expect{listener_creator.listen_to("ballou88")}.not_to change{User.count}
      end

      it "the user should be linked to the listener" do
        listener_creator.listen_to("ballou88")
        expect(listener.users).to include(@user)
      end
    end
  end
end
