module ListingsManager

	def self.update_listings csv_file_name
		csv_object = CSV.read csv_file_name
		csv_object.each do |row| 
			new_property = csv_row_to_hash(row)
			old_property = Property.find_or_create_by( mls: new_property[:mls] )
			old_property.update new_property
		end	

	end

	private 

	def self.csv_row_to_hash row
		{mls: row[0],
		pictures: row[1]}
	end
end