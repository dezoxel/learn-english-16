# coding: utf-8
require_relative 'sentence'
require_relative 'string'
require_relative 'russian_english_map'

class Russian_Sentence < Sentence

  def initialize
    @map = Russian_English_Map.new
  end

  def present_statement_for(pronoun, verb)
    verb = @map.russian_verb_by_pronoun(verb, pronoun)
    "#{pronoun} #{verb}"
  end

  def present_question_for(pronoun, verb)
    verb = @map.russian_verb_by_pronoun(verb, pronoun)
    "#{pronoun} #{verb}?"
  end

  def present_negation_for(pronoun, verb)
    verb = @map.russian_verb_by_pronoun(verb, pronoun)
    "#{pronoun} не #{verb}"
  end
end