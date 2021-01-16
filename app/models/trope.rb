class Trope < ActiveRecord::Base 
    has_many :char_tropes
    has_many :characters, through: :char_tropes
    has_many :novels, through: :characters

    def slug
        self.name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Trope.all.find do |x|
            x.slug == slug
        end 
    end 
end 