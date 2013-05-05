# encoding: utf-8
require_relative 'spec_helper'
require_relative '../lib/sentence'

describe Sentence do
  it "can formed with three different tenses" do
    Sentence.tenses.should == [:past, :present, :future]
  end 

  it "can stand in three expression forms" do
    Sentence.expression_forms.should == [:statement, :question, :negation]
  end

  it "defines personal pronouns is it he, she or it" do
    Sentence.is_he_she_it?("he").should be_true
    Sentence.is_he_she_it?("she").should be_true
    Sentence.is_he_she_it?("it").should be_true
    Sentence.is_he_she_it?("i").should be_false
    Sentence.is_he_she_it?("we").should be_false
  end

  it "has pronouns" do
    Sentence.pronouns(nil, :eng).should_not be_nil
    Sentence.pronouns(nil, :rus).should_not be_nil
  end

  it "has english pronouns of first person" do
    Sentence.pronouns(:first).should == ["i", "you", "we", "they", "he", "she", "it"]
  end

  it "has english pronouns of second person" do
    Sentence.pronouns(:second).should == ["me", "you",  "us",  "them",  "him", "her", "it"]
  end

  it "has english pronouns of third person" do
    Sentence.pronouns(:third).should == ["my", "your", "our", "their", "his", "her", "its"]
  end

  it "has russian pronouns of first person" do
    Sentence.pronouns(:first, :rus).should == ["я", "вы", "мы", "они", "он", "она", "оно"]
  end

  it "has russian pronouns of second person" do
    Sentence.pronouns(:second, :rus).should == ["мне/меня", "вас", "нас/нам", "им/их", "ему/его", "ее/ей", "этому"]
  end

  it "has russian pronouns of third person" do
    Sentence.pronouns(:third, :rus).should == ["мое/мои", "ваше", "наш/наше", "их", "его", "ее", "этого"]
  end
end