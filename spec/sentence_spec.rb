require_relative 'spec_helper'
require_relative '../lib/sentence'

describe Sentence do
  it "can formed with three different tenses" do
    Sentence.tenses.should == [:past, :present, :future]
  end 

  it "can stand in three expression forms" do
    Sentence.expression_forms.should == [:statement, :question, :negation]
  end

  it "defines personal pronouns is it he or she" do
    Sentence.is_he_she?("he").should be_true
    Sentence.is_he_she?("she").should be_true
    Sentence.is_he_she?("i").should be_false
    Sentence.is_he_she?("we").should be_false
  end
end