# encoding: utf-8
require_relative 'spec_helper'
require_relative '../lib/russian_verbs'

describe RussianVerbs do
  let(:table) { RussianVerbs.new }

  it "receieves hash of russian form of verb by english verb" do
    table[:love].should be_a Hash
  end 

  it "receives russian word in right form by pronoun" do
    table[:love][:infinitive].should == "любить"
    table[:love][:i].should == "люблю"
    table[:love][:thou].should == "любишь"
    table[:love][:you].should == "любите"
    table[:love][:we].should == "любим"
    table[:love][:they].should == "любят"
    table[:love][:he_she].should == "любит"
  end
end
