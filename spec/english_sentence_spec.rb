require_relative 'spec_helper'
require_relative '../lib/english_sentence'

describe English_Sentence do
  let(:sentence) { English_Sentence.new }

  it "#present_statement_for" do
    sentence.present_statement_for("i", "love").should == "i love"
    sentence.present_statement_for("you", "love").should == "you love"
    sentence.present_statement_for("we", "love").should == "we love"
    sentence.present_statement_for("they", "love").should == "they love"
    sentence.present_statement_for("he", "love").should == "he loves"
    sentence.present_statement_for("she", "love").should == "she loves"
  end

  it "#present_question_for" do
    sentence.present_question_for("i", "love").should == "do i love?"
    sentence.present_question_for("you", "love").should == "do you love?"
    sentence.present_question_for("we", "love").should == "do we love?"
    sentence.present_question_for("they", "love").should == "do they love?"
    sentence.present_question_for("he", "love").should == "does he love?"
    sentence.present_question_for("she", "love").should == "does she love?"
  end

  it "#present_question_for" do
    sentence.present_negation_for("i", "love").should == "i don't love"
    sentence.present_negation_for("you", "love").should == "you don't love"
    sentence.present_negation_for("we", "love").should == "we don't love"
    sentence.present_negation_for("they", "love").should == "they don't love"
    sentence.present_negation_for("he", "love").should == "he doesn't love"
    sentence.present_negation_for("she", "love").should == "she doesn't love"
  end

  it "#past_statement_for" do
    sentence.past_statement_for("i", "love").should == "i loved"
    sentence.past_statement_for("you", "love").should == "you loved"
    sentence.past_statement_for("we", "love").should == "we loved"
    sentence.past_statement_for("they", "love").should == "they loved"
    sentence.past_statement_for("he", "love").should == "he loved"
    sentence.past_statement_for("he", "see").should == "he saw"
    sentence.past_statement_for("she", "love").should == "she loved"
    sentence.past_statement_for("she", "see").should == "she saw"
  end

  it "#past_question_for" do
    sentence.past_question_for("i", "love").should == "did i love?"
    sentence.past_question_for("you", "love").should == "did you love?"
    sentence.past_question_for("we", "love").should == "did we love?"
    sentence.past_question_for("they", "love").should == "did they love?"
    sentence.past_question_for("he", "love").should == "did he love?"
    sentence.past_question_for("she", "love").should == "did she love?"
  end

  it "#past_negation_for" do
    sentence.past_negation_for("i", "love").should == "i didn't love"
    sentence.past_negation_for("you", "love").should == "you didn't love"
    sentence.past_negation_for("we", "love").should == "we didn't love"
    sentence.past_negation_for("they", "love").should == "they didn't love"
    sentence.past_negation_for("he", "love").should == "he didn't love"
    sentence.past_negation_for("she", "love").should == "she didn't love"
  end

  it "#future_statement_for" do
    sentence.future_statement_for("i", "love").should == "i will love"
    sentence.future_statement_for("you", "love").should == "you will love"
    sentence.future_statement_for("we", "love").should == "we will love"
    sentence.future_statement_for("they", "love").should == "they will love"
    sentence.future_statement_for("he", "love").should == "he will love"
    sentence.future_statement_for("she", "love").should == "she will love"
  end

  it "#future_question_for" do
    sentence.future_question_for("i", "love").should == "will i love?"
    sentence.future_question_for("you", "love").should == "will you love?"
    sentence.future_question_for("we", "love").should == "will we love?"
    sentence.future_question_for("they", "love").should == "will they love?"
    sentence.future_question_for("he", "love").should == "will he love?"
    sentence.future_question_for("she", "love").should == "will she love?"
  end

  it "#future_negation_for" do
    sentence.future_negation_for("i", "love").should == "i will not love"
    sentence.future_negation_for("you", "love").should == "you will not love"
    sentence.future_negation_for("we", "love").should == "we will not love"
    sentence.future_negation_for("they", "love").should == "they will not love"
    sentence.future_negation_for("he", "love").should == "he will not love"
    sentence.future_negation_for("she", "love").should == "she will not love"
  end
end
