require "spec_helper"

describe Lita::Interactors::CreateSource do
  subject(:instance){ described_class.new(recipient, 'hi!') }

  describe "#tell" do
    before do
      Lita::User.create(123, name: "jhon")
      Lita::Room.create_or_update("OLYTES", name: 'group_1')
      instance.perform
    end

    describe "to username" do
      context "with valid user" do
        let(:recipient){ "jhon" }

        it { expect(instance.success?).to be true }
        it { expect(instance.error).to be nil }
        it { expect(instance.source).to be_a_kind_of Lita::Source }
      end

      context "with invalid user" do
        let(:recipient){ "no_user" }

        it { expect(instance.success?).to be false}
        it { expect(instance.error).to_not  be nil }
        it { expect(instance.source).to_not be_a_kind_of Lita::Source }
      end
    end

    describe "into group" do
      context "with valid user" do
        let(:recipient){ "group_1" }

        it { expect(instance.success?).to be true }
        it { expect(instance.error).to be nil }
        it { expect(instance.source).to be_a_kind_of Lita::Source }
      end

      context "with invalid user" do
        let(:recipient){ "no_group" }

        it { expect(instance.success?).to be false}
        it { expect(instance.error).to_not  be nil }
        it { expect(instance.source).to_not be_a_kind_of Lita::Source }
      end
    end

  end
end
