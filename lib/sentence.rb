# encoding: utf-8

class Sentence
  attr_accessor :tense, :expression_form, :lang

  def initialize
    @parts = []
    @tense = :present
    @expression_form = :statement
    @lang = :eng
  end

  def pronoun(pronoun, options = {})
    person = options[:person] || :first
    lang = options[:lang] || @lang

    raise "Unknown person. Allowable are ':first', ':second', ':third'" unless self.class.validate_person(person) 
    raise "Unknown language. Allowable are ':eng', ':rus'" unless self.class.validate_language(lang) 

    word = Sentence.convert_pronoun({:to_person => person, :lang => lang}, pronoun)
    @parts <<  {:value => word, :type => :pronoun}
    self
  end

  def verb(verb, options = {})
    @parts <<  {:value => "to "+verb, :type => :verb}
    self
  end

  def add(value, type = nil)
    @parts << {:value => value, :type => type}
    self
  end

  def tense(tense)
    @tense = tense
    self
  end

  def expression_form(form)
    @expression_form = form
    self
  end


  def self.validate_person(person)
    self.persons.include? person
  end

  def self.validate_language(lang)
    self.languages.include? lang
  end

  def self.pronouns(person, lang = :eng)
    return @@pronouns[lang] if person.nil?
    @@pronouns[lang][person]
  end

  def self.convert_pronoun(options, pronoun)
    from_person = options[:from_person] || :first
    to_person = options[:to_person]
    index = self.pronouns(from_person).index(pronoun)
    self.pronouns(to_person)[index]
  end

  def self.tenses
    [:past, :present, :future]
  end

  def self.expression_forms
    [:statement, :question, :negation]
  end

  def self.persons
    [:first, :second, :third]
  end

  def self.languages
    [:eng, :rus]
  end

  def self.is_he_she_it?(pronoun)
    ["he", "she", "it"].include? pronoun
  end

protected

  @@pronouns = {
    :eng => {
      :first  => ["i",  "you",  "we",  "they",  "he",  "she", "it"],
      :second => ["me", "you",  "us",  "them",  "him", "her", "it"],
      :third  => ["my", "your", "our", "their", "his", "her", "its"],
    },
    :rus => {
      :first  => ["я",        "вы",   "мы",       "они",   "он",      "она",   "оно"],
      :second => ["мне/меня", "вас",  "нас/нам",  "им/их", "ему/его", "ее/ей", "этому"],
      :third  => ["мое/мои",  "ваше", "наш/наше", "их",    "его",     "ее",    "этого"],
    },
  }

end
