require_relative 'sentence'
require_relative 'string'
class EnglishSentence < Sentence

  def present_statement_for(pronoun, verb)
    verb += "s" if self.class.is_he_she? pronoun
    "#{pronoun} #{verb}"
  end

  def present_question_for(pronoun, verb)
    do_does = "do"
    do_does += "es" if self.class.is_he_she? pronoun
    "#{do_does} #{pronoun} #{verb}?"
  end

  def present_negation_for(pronoun, verb)
    do_does = "do"
    do_does += "es" if self.class.is_he_she? pronoun
    "#{pronoun} #{do_does}n't #{verb}"
  end

  def past_statement_for(pronoun, verb)
    verb = verb[0..-2] if verb.ends_with? "e"
    "#{pronoun} #{verb}ed"
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