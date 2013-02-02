class Sentence
  def self.tenses
    [:past, :present, :future]
  end

  def self.expression_forms
    [:statement, :question, :negation]
  end

  def self.is_he_she_it?(pronoun)
    ["he", "she", "it"].include? pronoun
  end
end
