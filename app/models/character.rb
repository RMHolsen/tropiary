class Character < ActiveRecord::Base
    belongs_to :novel
    has_many :char_tropes
    has_many :tropes, through: :char_tropes

    #include Sluggable

    def slug
        self.name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Character.all.find do |x|
        #self.class.all.find do |x|
        #why the crap isn't this working
            x.slug == slug
        end 
    end 
end 