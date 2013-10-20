require 'spec_helper'
require 'csv'

def csv_file
	       #mls status type address city area class price rooms bedrooms full bathrooms half baths lot size county subdivision waterfront listing date approx sqft. style siding exterior garage driveway basement floring heating fire place air conditioning sewer water heater water Location outside features
return %Q[352036|Active|Single Family|438 N Maryland Avenue|AtlanticCi|08401|Atlantic City|RESIDENTIAL|75000|8|4|2|0|Less than One Acre|Atlantic||||No|12/04/2009||Semi-Det/1/2Dbl|Aluminum|||Crawl Spac|Hardwood|W/W Carpet|Gas-Natura|||Public Sew|Gas|Public|Docks|Fenced Yar||Dining Roo|Laundry/Ut||||This is a Short Sale and subject to third party approval.  Financial Information breakdown: Lot 15: Vacant land value = $3,300 - Taxes: $54.98/2008  Lot 16: LV: 123,000; IV: $30,600 = NV: $153,600.  Call for Appointment.||MARTIN, MARSHA|||ORCHID REALTY|o157|||
				363445|Active|Single Family|27 Baratta Terrace|AtlanticCi|08401|Atlantic City|RESIDENTIAL|54000|6|3|1|1|Less than One Acre|Atlantic||||No|07/13/2010|1170|Townhouse||||||Gas-Natura|||Public Sew||Public|See Remark|||||||GREAT FOR INVESTORS. GOOD RENTAL INCOME POTENTIAL. Needs some renovation/TLC. Sold strictly AS IS. Buyer Responsible for all required certifications. This is a Short Sale.   All Contracts subject to Bank Approval. Close to Casinos and Boardwalk.||CAMPBELL, LARRY|||BALSLEY/LOSCO|107|||
				363756|Active|Single Family|441 Ridge Road|Millville|08332|Commercial Twp|RESIDENTIAL|60000|7|2|1|0|Less than One Acre|Cumberland||||No|07/21/2010|1128|Ranch|Brick Face|Vinyl|Three or M||Crawl Spac||Forced Air|Gas-Natura|Family Roo|Ceiling Fa|Septic|Gas|Well|Corner|Deck|Patio|Paved Road|Porch|Shed|Carbon Mon|Storage|Smoke/Fire|Walk In Cl|Dining Are|Laundry/Ut|Recreation|Storage At||||SHORT SALE Double wide manufactured home remodeled to 2 bedroom, 1 bath, living room, open floor plan kitchen with separate dining area, and family room. Wrap around deck. Includes shed. Corner location. AS IS||WHEATON, MICHELE|||WHEATON REAL ESTATE LLC|c056|||
				365702|Active|Single Family|130 Maxwell Ave|AtlanticCi|08401|Atlantic City|RESIDENTIAL|79900|5|2|1|0|Less than One Acre|Atlantic||||No|01/30/2013||2 Story|Vinyl|||Crawl Spac|Hardwood|Tile|W/W Carpet|Forced Air||Central|Public Sew|Gas|Public||Fenced Yar|Walk In Cl|Laundry/Ut||||Going for short sale. Nice home with C/A.  Hardwood Floors, Tile Bathroom and Kitchen. Good Conditon / Move in.||NAGEL, RIVKA|||PRUDENTIAL FOX and ROACH-144H|144h|||
				369363|Active|Single Family|922 Union St.|DowneTowns|08315|Downe Twp|RESIDENTIAL|85000|4|2|1|0|Less than One Acre|Cumberland||||No|11/10/2010||Bungalow|Vinyl||Stone|6 Ft. or M|Inside Ent|Masonry Fl|Vinyl|W/W Carpet|Oil||Ceiling Fa|Septic|Electric|Well|||Smoke/Fire|||||Charming little bungalow on a 1/4 acre with 2 bedrooms, 1 bath in quaint neighborhood in Dividing Creek||HARRIS, SUSAN|||ROARKE AGENCY, LLC|c026|||]
end


describe ListingsManager do
	it 'has updates listings method' do
		ListingsManager.should respond_to(:update_listings).with 1
	end
	
	it 'updates_listing' do 
		Property.stub(:find_or_create_by).and_return(FactoryGirl::build :property)
		Property.any_instance.stub :update!
		Property.should receive(:find_or_create_by).exactly(5) 

		CSV.stub(:read).and_return CSV.parse csv_file, col_sep: "|"

		ListingsManager.update_listings('filename').should == {}
		
	end



end