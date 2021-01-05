class Trope < ActiveRecord::Base 
    has_many :char_tropes
    has_many :characters, through: :char_tropes
    has_many :novels, through: :characters
end 