namespace :backfill do
    desc "Backfill categories with description"
  
    task :categories_description => :environment do
      Category.all.each do |category|
        # If the category has no description, set a default one
        if category.description.blank?
          category.update(description: "Default description for #{category.name}")
        end
      end
  
      puts "Categories backfilled successfully!"
    end
  end
  