# encoding: utf-8
require_relative 'spec_helper'
require_relative '../lib/russian_english_map'

describe Russian_English_Map do
  let(:map) { Russian_English_Map.new }

  it "receieves russian equivalent of english pronoun" do
    map[:pronoun, :i].should    == :я
    map[:pronoun, :you].should  == :вы
    map[:pronoun, :we].should   == :мы
    map[:pronoun, :they].should == :они
    map[:pronoun, :he].should   == :он
    map[:pronoun, :she].should  == :она
    map[:pronoun, :it].should   == :это
  end 

  it "translates into english or russian according to choosed mode" do
    map[:pronoun, :i].should == :я
    map.translate_to_language = :english
    map[:pronoun, :я].should == :i
  end

  it "receieves english equivalent of russian pronoun" do
    map.translate_to_language = :english

    map[:pronoun, :я].should   == :i
    map[:pronoun, :вы].should  == :you
    map[:pronoun, :мы].should  == :we
    map[:pronoun, :они].should == :they
    map[:pronoun, :он].should  == :he
    map[:pronoun, :она].should == :she
    map[:pronoun, :это].should == :it
  end 

  it "receives russian verb by english" do
    map[:verb, :love].should == :любить
  end

  it "receives english verb by russian in infinitive form" do
    map.translate_to_language = :english
    map[:verb, :любить].should == :love
  end

  it "receives russian verb in right form by verb and pronoun" do
    map.russian_verb_by_pronoun(:любить, :я).should   == :люблю
    map.russian_verb_by_pronoun(:любить, :вы).should  == :любите
    map.russian_verb_by_pronoun(:любить, :мы).should  == :любим
    map.russian_verb_by_pronoun(:любить, :они).should == :любят
    map.russian_verb_by_pronoun(:любить, :он).should  == :любит
    map.russian_verb_by_pronoun(:любить, :она).should == :любит
  end
end
