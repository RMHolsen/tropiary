class Novel < ActiveRecord::Base
    belongs_to :user
    #belongs_to :genre
    has_many :characters
    has_many :tropes, through: :characters 

    #validates :title, :genre, :word_count, :user_id, presence: true
    #Makes sure all of these fields are there otherwise no save functionality
    #At some point this should be reflected in the CSS/HTML

    def slug
        self.title.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Novel.all.find do |x|
            x.slug == slug
        end 
    end 
end 