# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if Account.find(:first).nil?
  puts ''
  puts 'No data was found in the ACCOUNT table so we are seeding it'
  account1 = Account.create(:address => "6158 Corte Altamira", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account2 = Account.create(:address => "6346 Calle Altamira", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account3 = Account.create(:address => "2886 Calle Reynoso", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account4 = Account.create(:address => "6976 Corte Verde", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account5 = Account.create(:address => "6904 Corte Pacifica", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account6 = Account.create(:address => "6906 Corte Barcelona", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account7 = Account.create(:address => "6435 Paseo Santa Maria", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account8 = Account.create(:address => "3152 Paseo Granada", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account9 = Account.create(:address => "6479 Calle Esperanza", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account10 = Account.create(:address => "6529 Calle de la Mancha", :city => "Pleasanton", :state => "CA", :zip => "94566")
  account11 = Account.create(:address => "6781 Paseo Catalina", :city => "Pleasanton", :state => "CA", :zip => "94566")
else
  puts ''
  puts 'There is data in the Account table so we are assuming this seed data already exits in the table'
end

#Ben's addess
if Account.find(:first, :conditions => ["address = ?", "4137 E Oxford Ln."]).nil?
  puts ''
  puts 'No data was found for Bens address in the Accounts table so we are seeding it'
  account1 = Account.create(:address => "4137 E Oxford Ln.", :city => "Gilbert", :state => "AZ", :zip => "85295")
end



