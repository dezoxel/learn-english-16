require_relative 'spec_helper'
require_relative '../lib/english_sentence'

describe English_Sentence do
  let(:sentence) { English_Sentence.new }

  context "when builds present statement sentence" do
    let(:sentence) { English_Sentence.new.tense(:present).expression_form(:statement) }

    it "builds present statement sentence" do
      sentence.pronoun("i").verb("love").assemble!.should == "i love"
    end

    it "adds '-s' ending to the third person pronouns" do
      sentence.pronoun("he").verb("love").assemble!.should == "he loves"
    end

    it "recognizes cases with '-s' and '-es' endings" do
      sentence.pronoun("she").verb("go").assemble!.should == "she goes"
    end

  end

  context "when builds present question sentence" do
    let(:sentence) { English_Sentence.new.tense(:present).expression_form(:question) }

    it "builds present question sentence" do
      sentence.pronoun("we").verb("love").assemble!.should == "do we love ?"
    end

    it "uses 'does' auxiliary verb for the third person pronouns" do
      sentence.pronoun("he").verb("love").assemble!.should == "does he love ?"
    end

  end

  context "when builds present negation sentence" do
    let(:sentence) { English_Sentence.new.tense(:present).expression_form(:negation) }

    it "builds present negation sentence" do
      sentence.pronoun("you").verb("love").assemble!.should == "you don't love"
    end

    it "uses `doesn't` auxiliary verb for the third person pronouns" do
      sentence.pronoun("she").verb("love").assemble!.should == "she doesn't love"
    end

  end

  context "when builds past statement sentence" do
    let(:sentence) { English_Sentence.new.tense(:past).expression_form(:statement) }

    it "builds past statement sentence" do
      sentence.pronoun("they").verb("love").assemble!.should == "they loved"
    end

    it "recognizes irregular verbs" do
      sentence.pronoun("it").verb("see").assemble!.should == "it saw"
    end

  end

  it "builds past question sentence" do
    sentence.tense(:past).expression_form(:question)
      .pronoun("you").verb("love").assemble!.should == "did you love ?"
  end

  it "builds past negation sentence" do
    sentence.tense(:past).expression_form(:negation)
      .pronoun("she").verb("love").assemble!.should == "she didn't love"
  end

  it "builds future statement sentence" do
    sentence.tense(:future).expression_form(:statement)
      .pronoun("i").verb("love").assemble!.should == "i will love"
  end

  it "builds future question sentence" do
    sentence.tense(:future).expression_form(:question)
      .pronoun("you").verb("love").assemble!.should == "will you love ?"
  end

  it "builds future negation sentence" do
    sentence.tense(:future).expression_form(:negation)
      .pronoun("they").verb("love").assemble!.should == "they won't love"
  end

  describe "sentence DSL" do

    it "uses 'present' tense and 'statement' expression form by default" do
      sentence.pronoun("i").verb("love").assemble!.should == "i love"
    end

    it "supports second person pronoun" do
      sentence.pronoun("we").verb("love").pronoun("he", :person => :second).assemble!.should == "we love him"
    end

    it "supports question words" do
      sentence.expression_form(:question).add("what").pronoun("you").verb("do").assemble!.should == "what do you do ?"
    end

    it "supports prepositions and nouns" do
      sentence.pronoun("i").verb("live").add("in").add("London").assemble!.should == "i live in London"
    end

    it "supports additional verbs" do
      sentence.pronoun("i").verb("love").verb("live").assemble!.should == "i love to live"
    end
  end
end
