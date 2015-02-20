require "spec_helper"

describe ::Recommender::Engine do
  let(:user) { build(:user) }
  let(:engine) { build(:engine, user: user) }

  describe "#product_recommendations" do
    subject { engine.product_recommendations(*other_users) }

    let(:other_users) do
      [
        build(:user),
        build(:user),
        build(:user)
      ]
    end

    it "returns product recommendations" do
      expect(subject).to be_an(Array)
    end

    it "must be empty" do
      expect(subject.size).to be(0)
    end

    context "with recommendable products" do
      let(:user) { build(:user, products: [ 3, 5, 8]) }
      let(:other_users) do
        [
          build(:user, products: [ 1, 2, 3]),
          build(:user, products: [ 4, 2, 8 ]),
          build(:user, products: [ 7, 9, 1 ])
        ]
      end

      it "must not be empty" do
        expect(subject.size).to_not eq([1, 2, 4])
      end
    end

    context "with no recommendable products" do
      let(:user) { build(:user, products: [ 3, 5, 8]) }
      let(:other_users) do
        [
          build(:user, products: [ 1, 2, 4]),
          build(:user, products: [ 4, 2, 9 ]),
          build(:user, products: [ 7, 9, 1 ])
        ]
      end

      it "must not be empty" do
        expect(subject.size).to be(0)
      end
    end
  end
end
