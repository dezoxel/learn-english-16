require_relative 'spec_helper'
require_relative '../lib/conversation'

class Conversation
  def waiting_for_answer
    "i love"
  end
end

describe Conversation do
  let(:conversation) { Conversation.new }
  let(:verbs) { YAML.load_file('./db/verbs.yml').keys }

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

  it "generates tense, form, pronoun and verb for constructing sentence" do
    data = conversation.generate_rand_data_for_sentence
    tense, form, pronoun, verb = data

    Sentence.tenses.should include tense
    Sentence.expression_forms.should include form
    Sentence.pronouns("first").should include pronoun
    verbs.should include verb
  end

  it "generates rand tense, form, pronoun and verb for constructing sentence" do
    data1 = conversation.generate_rand_data_for_sentence
    data2 = conversation.generate_rand_data_for_sentence

    data1.should_not == data2
  end
end
