require 'csv'
CSV.foreach "lib/Art Collection.csv" do |row|
	  Artwork.create(:filename => row[0], :object => row[1], :creator => row[2], :title => row[3], :description => row[4], :location => row[5], :recfrom => row[6], :date => row[7])
end
User.create(:email=>'test@test.com', :password=>'password',:password_confirmation=>'password', :issuper => true)

t = Tour.create(:name => "Sample Tour")
t.tour_items.create(:artwork => Artwork.find(12))
t.tour_items.create(:artwork => Artwork.find(14))
t.tour_items.create(:artwork => Artwork.find(18))
t.tour_items.create(:artwork => Artwork.find(13))
t.tour_items.create(:artwork => Artwork.find(6))
t.tour_items.create(:artwork => Artwork.find(98))
t.tour_items.create(:artwork => Artwork.find(67))
