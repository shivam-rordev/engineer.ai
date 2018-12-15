# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create a role named "admin"
admin_role = Role.create!(:name => "admin")

# create an admin user
admin_user = User.create!(:email => "admin@sd2labs.com", password: 'admin@123' ,first: "Admin", last: 'user')

# assign the admin role to the admin user.  (This bit of rails
# magic creates a user_role record in the database.)
admin_user.roles << admin_role

