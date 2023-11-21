namespace :backfill do
    desc "Backfill categories with description"
  
    task :categories_description => :environment do
      
        # If the category has no description, set a default one
        descriptions = {
          "General" => "Explore a variety of general topics and stay informed on a wide range of sibjects",
          "Technology" => "Stay-up-to-date with the latest in technology and innovation from around the world",
          "Travel" => "Embark on a jounrey of discovery with travel-related atricles. tips and destination guides."
          "Food" => "Indulge in a culinary adventure with mourhwatering recipes, foodies tips, and dining experinces.",
          "Fashion" => "Dive into the world of fashion, trends, amd style inspirations to express your unique personality."
    }
    
    Category.where(description:nil).each do |category|
      description = description[category.name]

      







  end
  