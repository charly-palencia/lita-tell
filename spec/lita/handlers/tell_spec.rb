require "spec_helper"

describe Lita::Handlers::Tell, lita_handler: true do
  it { is_expected.to route('tell username some message') }
  it { is_expected.to route('say “some message” to username') }

  describe "#tell route" do
    let(:message) { 'hi sir!' }

    before do
      allow_any_instance_of(Lita::Interactors::CreateSource).to receive(:perform) { interactor }
      send_message('tell user_or_group hi sir!', as: user)
    end

    context "with valid user" do
      let(:interactor) { double(success?: true, message: message, source: double(user: "username")) }

      it { expect(replies.first).to eq(message) }
      it { expect(replies[1]).to eq('Your message has been sent') }
    end

    context "with invalid user" do
      let(:error) { 'Either a user or a room is required.' }
      let(:interactor){ double(success?: false, error: error) }
      it { expect(replies.first).to eq(error) }
    end
  end


  describe "#say route" do
    let(:message) { 'hi sir!' }
    before do
      allow_any_instance_of(Lita::Interactors::CreateSource).to receive(:perform) { interactor }
      send_message('say “hi sir!” to user_or_group', as: user)
    end

    context "with valid user" do
      let(:interactor) { double(success?: true, message: message, source: double(user: "username")) }

      it { expect(replies.first).to eq(message) }
      it { expect(replies[1]).to eq('Your message has been sent') }
    end

    context "with invalid user" do
      let(:error) { 'Either a user or a room is required.' }
      let(:interactor) { double(success?: false, error: error) }
      it { expect(replies.first).to eq(error) }
    end
  end
end
