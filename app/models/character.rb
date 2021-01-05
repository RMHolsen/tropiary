class Character < ActiveRecord::Base
    belongs_to :novel
    has_many :char_tropes
    has_many :tropes, through: :char_tropes
end 