require_relative 'sentence'
require_relative 'string'
require 'yaml'

class English_Sentence < Sentence

  def initialize
    @irregular_verbs = YAML.load_file("./db/irregular_verbs.yml")
  end

  def present_statement_for(pronoun, verb)
    verb += "s" if self.class.is_he_she_it? pronoun
    "#{pronoun} #{verb}"
  end

  def present_question_for(pronoun, verb)
    do_does = "do"
    do_does += "es" if self.class.is_he_she_it? pronoun
    "#{do_does} #{pronoun} #{verb}?"
  end

  def present_negation_for(pronoun, verb)
    do_does = "do"
    do_does += "es" if self.class.is_he_she_it? pronoun
    "#{pronoun} #{do_does}n't #{verb}"
  end

  def past_statement_for(pronoun, verb)
    verb = @irregular_verbs[verb] ? @irregular_verbs[verb]["second"] : verb[0..-2]+"ed" if verb.ends_with? "e"
    "#{pronoun} #{verb}"
  end

  def past_question_for(pronoun, verb)
    "did #{pronoun} #{verb}?"
  end

  def past_negation_for(pronoun, verb)
    "#{pronoun} didn't #{verb}"
  end

  def future_statement_for(pronoun, verb)
    "#{pronoun} will #{verb}"
  end

  def future_question_for(pronoun, verb)
    "will #{pronoun} #{verb}?"
  end

  def future_negation_for(pronoun, verb)
    "#{pronoun} will not #{verb}"
  end
end