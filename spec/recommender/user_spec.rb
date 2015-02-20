require "spec_helper"

describe ::Recommender::User do
  let(:user) { build(:user) }

  describe "#initialize" do
    it "has 0 products" do
      expect(user.products.size).to be(0)
    end
  end

  describe "#add_product" do
    subject { user.add_product(product_id) }

    let(:product_id) { rand(1000) }

    it "adds the product to the list" do
      expect {
        subject
      }.to change { user.products.size }.from(0).to(1)
    end
  end
end
