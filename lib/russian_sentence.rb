# coding: utf-8
require_relative 'sentence'
require_relative 'string'

class Russian_Sentence < Sentence

  def initialize
    @verbs = YAML.load_file("./db/verbs.yml")
    @russian_verbs = YAML.load_file("./db/russian_verbs.yml")
    @pronouns = YAML.load_file("./db/pronouns.yml")
  end

  def present_statement_for(pronoun, verb)
    verb = @russian_verbs[verb]["настоящее"][pronoun]
    "#{pronoun} #{verb}"
  end

  def present_question_for(pronoun, verb)
    verb = @russian_verbs[verb]["настоящее"][pronoun]
    "#{pronoun} #{verb}?"
  end

  def present_negation_for(pronoun, verb)
    verb = @russian_verbs[verb]["настоящее"][pronoun]
    "#{pronoun} не #{verb}"
  end

  def past_statement_for(pronoun, verb)
    verb = @russian_verbs[verb]["прошлое"][pronoun]
    "#{pronoun} #{verb}"
  end

  def past_question_for(pronoun, verb)
    verb = @russian_verbs[verb]["прошлое"][pronoun]
    "#{pronoun} #{verb}?"
  end

  def past_negation_for(pronoun, verb)
    verb = @russian_verbs[verb]["прошлое"][pronoun]
    "#{pronoun} не #{verb}"
  end

  def future_statement_for(pronoun, verb)
    verb = @russian_verbs[verb]["будущее"][pronoun]
    "#{pronoun} #{verb}"
  end

  def future_question_for(pronoun, verb)
    verb = @russian_verbs[verb]["будущее"][pronoun]
    "#{pronoun} #{verb}?"
  end

  def future_negation_for(pronoun, verb)
    verb = @russian_verbs[verb]["будущее"][pronoun]
    "#{pronoun} не #{verb}"
  end
end