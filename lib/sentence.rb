# encoding: utf-8

class Sentence
  attr :tense, :expression_form, :lang

  def initialize
    @parts = []
    @verbs = YAML.load_file("./db/verbs.yml")
    @tense = :present
    @expression_form = :statement
    @lang = :eng
  end

  def pronoun(pronoun, options = {})
    person = options[:person] || :first
    lang = options[:lang] || @lang

    raise "Unknown person. Allowable are ':first', ':second', ':third'" unless Sentence.validate_person(person) 
    raise "Unknown language. Allowable are ':eng', ':rus'" unless Sentence.validate_language(lang) 
    raise "Unknown pronoun. Allowable are '#{Sentence.pronouns(:first, lang).join(", ")}'" unless Sentence.validate_pronoun(pronoun, :first, lang) 

    word = Sentence.convert_pronoun({:to_person => person, :lang => lang}, pronoun)
    @parts <<  {:value => word, :type => :pronoun}
    self
  end

  def verb(verb, options = {})
    raise "Unknown verb #{verb}." unless validate_verb(verb) 
    verb = "to " + verb if @lang == :eng
    @parts <<  {:value => verb, :type => :verb}
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

  def validate_verb(verb)
    verbs = @lang == :eng ? @verbs.keys : @verbs.values
    verbs.include? verb
  end

  def self.validate_pronoun(pronoun, person, lang = :eng)
    self.pronouns(person, lang).include? pronoun
  end

  def self.pronouns(person, lang = :eng)
    return @@pronouns[lang] if person.nil?
    @@pronouns[lang][person]
  end

  def self.convert_pronoun(options, pronoun)
    from_person = options[:from_person] || :first
    to_person = options[:to_person]
    lang = options[:lang]
    index = self.pronouns(from_person, lang).index(pronoun)
    self.pronouns(to_person, lang)[index]
  end

  def self.tenses
    [:past, :present, :future]
  end

  def self.rus_tenses
    [:прошлое, :настоящее, :будущее]
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
