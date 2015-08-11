require "spec_helper"

describe Lita::Handlers::Tell, lita_handler: true do
  it { is_expected.to route('tell "some message" to chalien') }

  describe "tell action with username" do
    context "with valid message" do

      before do
        Lita::User.create(123, name: "chalien")
        send_message('tell "hi" to chalien', as: user)
      end

      it { expect(replies.first).to eq("hi") }
      it { expect(replies[1]).to eq("Your message has been sent") }
    end
  end
end
