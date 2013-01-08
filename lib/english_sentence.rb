require_relative 'sentence'
class EnglishSentence < Sentence

  def present_statement_for(pronoun, verb)
    verb += "s" if self.class.is_he_she? pronoun
    "#{pronoun} #{verb}"
  end

  def present_question_for(pronoun, verb)
  end

  def present_negation_for(pronoun, verb)
  end
end