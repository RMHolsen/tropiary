class CreateUser < ActiveRecord::Migration[4.2]
    def change
        create_table :users do |u|
            u.string :name
            u.string :username
            u.string :password_digest
        end 
    end 
end 