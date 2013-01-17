class Sentence
  def self.tenses
    [:past, :present, :future]
  end

  def self.expression_forms
    [:statement, :question, :negation]
  end

  def self.is_he_she?(pronoun)
    ["he", "she"].include? pronoun
  end
end
