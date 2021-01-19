class User < ActiveRecord::Base
    has_secure_password
    has_many :novels
    validates_presence_of :username
    validates_uniqueness_of :username
    #Makes sure that all usernames are unique or else you can't save your user profile
    #Also should be reflected in the HTML/CSS at some point
end 