module Sluggable

    def slug
        self.name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug 
        Self.all.find do |x|
            x.slug == slug
        end 
    end 
end 