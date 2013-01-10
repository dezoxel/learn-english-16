require_relative 'sentence'
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
end