# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



# db/seeds.rb

puts "Clearing existing data..."


# Create Themes
puts "Creating themes..."
themes = ['Gardening', 'Sustainability', 'Urban Farming', 'Permaculture', 'Organic Gardening'].map do |theme_name|
  Theme.find_or_create_by!(name: theme_name)
end

# Create Users
#puts "Creating users..."
#user = 
#  User.create!(
#    username: "user8",
#    email: "user8@example.com",
#    password: 'password',
#    password_confirmation: 'password',
#   user_role: 'user'
#  )



# Ensure we have an admin user
mod_user = User.create!(
  username: 'simonmod',
  email: 'simonmod@example.com',
 password: 'moderatorpassword',
 password_confirmation: 'moderatorpassword',
user_role: 'moderator'
)

puts "Seed data creation completed!"
puts "Created:"
puts "#{Theme.count} themes"
puts "#{User.count} users"
puts "#{Article.count} articles"
puts "#{ArticleApproval.count} article approvals"
puts "#{Comment.count} comments"

