class CreateNovels < ActiveRecord::Migration
    def change
        create_table :novels do |n|
            n.string :title
            n.string :genre
            n.integer :word_count
            n.integer :trope_id
        end 
    end 
end 