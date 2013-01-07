require_relative 'spec_helper'
require_relative '../lib/conversation'

class Conversation
  def waiting_for_answer
    "i love"
  end
end

describe Conversation do

  context "when finishing" do
    let(:conversation) { Conversation.new }
    let(:answer) { "exit" }

    it "ends conversation by special answer" do
      conversation.want_to_exit?(answer).should be_true
    end
  end 
end
