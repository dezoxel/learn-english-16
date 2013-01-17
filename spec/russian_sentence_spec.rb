# coding: utf-8
require_relative 'spec_helper'
require_relative '../lib/russian_sentence'

describe Russian_Sentence do
  let(:sentence) { Russian_Sentence.new }

  it "#present_statement_for" do
    sentence.present_statement_for("я",   "любить").should == "я люблю"
    sentence.present_statement_for("вы",  "любить").should == "вы любите"
    sentence.present_statement_for("мы",  "любить").should == "мы любим"
    sentence.present_statement_for("они", "любить").should == "они любят"
    sentence.present_statement_for("он",  "любить").should == "он любит"
    sentence.present_statement_for("она", "любить").should == "она любит"
  end

  it "#present_question_for" do
    sentence.present_question_for("я",   "любить").should == "я люблю?"
    sentence.present_question_for("вы",  "любить").should == "вы любите?"
    sentence.present_question_for("мы",  "любить").should == "мы любим?"
    sentence.present_question_for("они", "любить").should == "они любят?"
    sentence.present_question_for("он",  "любить").should == "он любит?"
    sentence.present_question_for("она", "любить").should == "она любит?"
  end

  it "#present_negation_for" do
    sentence.present_negation_for("я",   "любить").should == "я не люблю"
    sentence.present_negation_for("вы",  "любить").should == "вы не любите"
    sentence.present_negation_for("мы",  "любить").should == "мы не любим"
    sentence.present_negation_for("они", "любить").should == "они не любят"
    sentence.present_negation_for("он",  "любить").should == "он не любит"
    sentence.present_negation_for("она", "любить").should == "она не любит"
  end
end
