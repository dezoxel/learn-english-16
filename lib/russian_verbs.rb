# encoding: utf-8
class RussianVerbs
  def initialize
    @table = {
      program:    {infinitive: "программировать", i: "программирую", thou: "программируешь", you: "программируете", we: "программируем", they: "программируют", he_she: "программирует"},
      love:       {infinitive: "любить",          i: "люблю",        thou: "любишь",         you: "любите",         we: "любим",         they: "любят",         he_she: "любит"},
      live:       {infinitive: "жить",            i: "живу",         thou: "живешь",         you: "живете",         we: "живем",         they: "живут",         he_she: "живет"},
    }
  end

  def [](english_verb)
    @table[english_verb]
  end
end