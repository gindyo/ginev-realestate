module ListingsManager

	def self.update_listings csv_file_path
		results = {created: [], updated: [], deleted: []}
		csv_object = CSV.read csv_file_path
		csv_object.each do |row| 
			new_property = csv_row_to_hash(row)
			old_property = Property.find_or_create_by( mls: new_property[:mls] )
			old_property.update! new_property
		end	
		results
	end

	private 

	def self.csv_row_to_hash row
		{
			mls: row[0],
			status: row[1],
			type: row[2],
			address: row[3],
			city: row[4],
			area: row[5],
			class: row[6],
			price: row[7],
			rooms: row[8],
			bedrooms: row[9],
			full: row[10],
			bathrooms: row[11],
			half: row[12],
			baths: row[13],
			lot: row[14],
			size: row[15],
			county: row[16],
			subdivision: row[17],
			waterfront: row[18],
			listing: row[19],
			date: row[20],
			approx: row[21],
			sqft: row[22],
			style: row[23],
			siding: row[24],
			exterior: row[25],
			garage: row[26],
			driveway: row[27],
			basement: row[28],
			floring: row[29],
			heating: row[30],
			fire: row[31],
			place: row[32],
			air: row[33],
			conditioning: row[34],
			sewer: row[35],
			water: row[36],
			heater: row[37],
			water: row[38],
			location: row[39],
			outside: row[40],
			features: row[41]
		}

	end
end