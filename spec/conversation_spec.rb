require_relative 'spec_helper'
require_relative '../lib/conversation'

class Conversation
  def waiting_for_answer
    "i love"
  end
end

describe Conversation do
  let(:conversation) { Conversation.new }

  it "has a congrats function when companion answers correctly" do
    conversation.respond_to?(:congrats).should be_true
  end

  it "has a upset function when companion answers incorrectly" do
    conversation.respond_to?(:upset).should be_true
  end

  context "when finishing" do
    let(:conversation) { Conversation.new }
    let(:answer) { "exit" }

    it "ends conversation by special answer" do
      conversation.want_to_exit?(answer).should be_true
    end
  end 

end
