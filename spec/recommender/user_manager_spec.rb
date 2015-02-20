require "spec_helper"

describe ::Recommender::UserManager do
  let(:manager) { ::Recommender::UserManager }

  describe ".find_or_create_user" do
    subject { manager.find_or_create_user(user_id) }

    let(:user_id) { rand(10000) }

    it "returns a User object" do
      expect(subject).to be_a(::Recommender::User)
    end

    context "when user exists" do
      it "returns the same object" do
        u = subject
        expect(subject).to be(u)
      end
    end
  end

  describe ".delete_user" do
    subject { manager.delete_user(user_id) }

    let(:user_id) { rand(10000) }

    context "when a user does not exist" do
      it "returns nil" do
        expect(subject).to be(nil)
      end
    end

    context "when a user exists" do
      before do
        manager.find_or_create_user(user_id)
      end

      it "returns the object" do
        expect(subject).to be_a(::Recommender::User)
      end

      it "doesnt have the user object anymore" do
        manager.delete_user(user_id)
        expect(subject).to be(nil)
      end
    end

  end
end
