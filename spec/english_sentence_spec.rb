require_relative 'spec_helper'
require_relative '../lib/english_sentence'

describe EnglishSentence do
  let(:sentence) { EnglishSentence.new }

  it "#present_statement_for" do
    sentence.present_statement_for("i", "love").should == "i love"
    sentence.present_statement_for("thou", "love").should == "thou love"
    sentence.present_statement_for("you", "love").should == "you love"
    sentence.present_statement_for("we", "love").should == "we love"
    sentence.present_statement_for("they", "love").should == "they love"
    sentence.present_statement_for("he", "love").should == "he loves"
    sentence.present_statement_for("she", "love").should == "she loves"
  end
end
