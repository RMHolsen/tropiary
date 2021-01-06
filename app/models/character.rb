class Character < ActiveRecord::Base
    belongs_to :novel
    has_many :char_tropes
    has_many :tropes, through: :char_tropes

    #include Sluggable

    def slug
        self.name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Self.all.find do |x|
            x.slug == slug
        end 
    end 
end 