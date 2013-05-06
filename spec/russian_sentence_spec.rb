# coding: utf-8
require_relative 'spec_helper'
require_relative '../lib/russian_sentence'

describe Russian_Sentence do
  let(:sentence) { Russian_Sentence.new }

  it "builds present statement sentence" do
    sentence.tense(:present).expression_form(:statement)
      .pronoun("я").verb("любить").assemble!.should == "я люблю"
  end

  it "builds present question sentence" do
    sentence.tense(:present).expression_form(:question)
      .pronoun("вы").verb("любить").assemble!.should == "вы любите ?"
  end

  it "builds present negation sentence" do
    sentence.tense(:present).expression_form(:negation)
      .pronoun("мы").verb("любить").assemble!.should == "мы не любим"
  end

  it "builds past statement sentence" do
    sentence.tense(:past).expression_form(:statement)
      .pronoun("вы").verb("любить").assemble!.should == "вы любили"
  end

  it "builds past question sentence" do
    sentence.tense(:past).expression_form(:question)
      .pronoun("он").verb("любить").assemble!.should == "он любил ?"
  end

  it "builds past negation sentence" do
    sentence.tense(:past).expression_form(:negation)
      .pronoun("она").verb("любить").assemble!.should == "она не любила"
  end

  it "builds future statement sentence" do
    sentence.tense(:future).expression_form(:statement)
      .pronoun("они").verb("любить").assemble!.should == "они будут любить"
  end

  it "builds future question sentence" do
    sentence.tense(:future).expression_form(:question)
      .pronoun("я").verb("любить").assemble!.should == "я буду любить ?"
  end

  it "builds future negation sentence" do
    sentence.tense(:future).expression_form(:negation)
      .pronoun("вы").verb("любить").assemble!.should == "вы не будете любить"
  end

  it "database of russian words must be consistent" do
    Russian_Sentence.database_verbs_diff.should == []
  end

  describe "sentence DSL" do

    it "uses 'present' tense and 'statement' expression form by default" do
      sentence.pronoun("я").verb("любить").assemble!.should == "я люблю"
    end

    it "supports second person pronoun" do
      sentence.pronoun("мы").verb("любить").pronoun("он", :person => :second).assemble!.should == "мы любим ему/его"
    end

    it "supports question words" do
      sentence.expression_form(:question).add("что").pronoun("вы").verb("делать").assemble!.should == "что вы делаете ?"
    end

    it "supports prepositions and nouns" do
      sentence.pronoun("я").verb("жить").add("в").add("Лондон").assemble!.should == "я живу в Лондон"
    end

    it "supports additional verbs" do
      sentence.pronoun("я").verb("любить").verb("жить").assemble!.should == "я люблю жить"
    end
  end

end
