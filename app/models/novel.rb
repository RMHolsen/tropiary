class Novel < ActiveRecord::Base
    belongs_to :user
    has_many :characters
    has_many :tropes, through: :characters 

    #include Sluggable

    def slug
        self.title.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Novel.all.find do |x|
            x.slug == slug
        end 
    end 
end 