class Novel < ActiveRecord::Base
    has_many :characters
    has_many :tropes, through: :characters 

    include Sluggable
end 