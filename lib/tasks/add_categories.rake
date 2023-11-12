namespace :db do
    #stars with a description, plain english
    desc "Add four categories to the database"
    #when it starts executing by using task 
    task add_categories: :environment do 
    #Define your category name here 
        category_names = ["Technology", "Travel", "Food", "Fashion"]

        category_names.each do |name|
            Category.find_or_create_by(name: name)
            puts "Category '#{name}' was added."
        end 
        puts "Categories added succesfully"
    end 
end 