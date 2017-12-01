class Character < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :maps
  has_and_belongs_to_many :adventures

  def self.make_default_character user
    c = Character.new
    c.user = user
    c.name = "Cam"
    c.backstory = "A default character to use in your adventures!"
    c.profession = "Warrior"
    c.race = "Human"

    max_level = 20
    c.level = rand(0 .. max_level)
    c.strength = rand(0 .. max_level)
    c.dexterity = rand(0 .. max_level)
    c.constitution = rand(0 .. max_level)
    c.intelligence = rand(0 .. max_level)
    c.wisdom = rand(0 .. max_level)
    c.charisma = rand(0 .. max_level)
    c.save

  end
end
