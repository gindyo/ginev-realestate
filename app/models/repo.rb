module Repo
    def self.for_sale
      self.sale_properties
    end
    def self.for_rent
      self.rent_properties
    end
    def self.featured_properties
      ids = [1,2,3,4,5]
      self.sale_properties.select{|p| ids.include? p.id }
    end
    
   
    private 
    def self.sale_properties
      areas = ['Margate', 'Ventnor', 'Ocean City', 'Brigantine', 'Longport', 'Somers Point', 'Northfield']
      streets = ['Park ave.', 'Main str.', 'Broad str.', 'Atlantic ave.' ]
      props = [
        Property.new({id: 1, year_built: Random.rand(1955..2013), price: 1000000, address: '123 Main str.', pictures: ['/assets/1.jpg'], bedrooms: 5, bathrooms: 3, area: 'Margate'}),
        Property.new({id: 2, year_built: Random.rand(1955..2013), price: 10000000, address: '123 Main str.', pictures: ['/assets/5.jpg'], bedrooms: 5, bathrooms: 3, area: 'Ventnor'}),
        Property.new({id: 3, year_built: Random.rand(1955..2013), price: 300000, address: '123 Main str.', pictures: ['/assets/2.jpg'], bedrooms: 5, bathrooms: 3, area: 'Ocean City'}),
        Property.new({id: 4, year_built: Random.rand(1955..2013), price: 12000000, address: '123 Main str.', pictures: ['/assets/4.jpg'], bedrooms: 5, bathrooms: 3, area: 'Brigantine'}),
        Property.new({id: 5, year_built: Random.rand(1955..2013), price: 4000000, address: '123 Main str.', pictures: ['/assets/3.jpg'], bedrooms: 5, bathrooms: 3, area: 'Longport'})
      ]
      i = 5
      for p in [15001, 15024, 15025, 15028, 15060, 15084, 15085, 15086, 15087, 15088, 15089, 15093, 15093, 15117, 15127, 15131, 15137, 15137, 15137, 15139, 15140, 15143, 15145, 15151, 15151, 15156, 15156, 15157, 15157, 15164, 15169, 15187, 15189, 15191, 15199, 15199, 15201, 15201, 15216, 15220, 15231, 15235, 15239, 15254, 15256, 15259, 15263, 15266, 15270, 15273, 15274, 15279, 15281, 15286, 15287, 15292, 15303, 15306, 15308, 15316, 15316, 15318, 15319, 15324, 15326, 15327, 15329, 15329, 15330, 15332, 15332, 15335, 15336, 15337, 15338, 15345, 15346, 15346, 15347, 15353, 15356, 15356, 15362, 15364, 15365, 15365, 15369, 15369, 15373, 15373, 15374, 15374, 15377, 15379, 15381, 15382, 15383, 15385, 15385, 15388, 15388, 15404, 15407, 15408, 15411, 15412, 15413, 15413, 15414, 15415, 15418, 15420, 15422, 15423, 15425, 15427, 15427, 15433, 15433, 15434, 15437, 15438, 15440, 15441, 15444, 15447, 15450, 15453, 15456, 15458, 15460, 15464, 15468, 15470, 15472, 15473, 15475, 15475, 15486, 15487, 15509, 15510, 15516, 15523, 15532, 15539, 15541, 15541, 15557, 15560, 15565, 15568, 15573, 15574, 15580, 15582, 15591, 15616, 15618, 15619, 15629, 15632, 15632, 15635, 15639, 15639, 15643, 15660, 15668, 15668, 15671, 15683, 15684, 15688, 15758, 15775, 15818, 15837, 15855, 15873, 15873, 15914, 15929, 15943, 15943, 15966, 15969, 15976, 15977] do
        i = i+1
        props << Property.new({
          id: i,
          price: Random.rand(0..7000000),
          address: "#{p} #{streets[Random.rand(0..3)]}",
          pictures: ["#{p}.0.jpg"],
          bedrooms: Random.rand(0..8),
          bathrooms: Random.rand(0..5),
          area: areas[Random.rand(0..areas.count-1)],
          year_built: Random.rand(1955..2013)
        })
        #props.push ([p, Random.rand(0..700000), p.to_s+'.0.TH.jpg', Random.rand(0..7), Random.rand(0..8), '1 main'])
      end
      props
    end

    def self.rent_properties
      areas = ['Margate', 'Ventnor', 'Ocean City', 'Brigantine', 'Longport', 'Somers Point', 'Northfield']
      streets = ['Park ave.', 'Main str.', 'Broad str.', 'Atlantic ave.' ]
      props = []
      i = 5
      for p in [15001, 15024, 15025, 15028, 15060, 15084, 15085, 15086, 15087, 15088, 15089, 15093, 15093, 15117, 15127, 15131, 15137, 15137, 15137, 15139, 15140, 15143, 15145, 15151, 15151, 15156, 15156, 15157, 15157, 15164, 15169, 15187, 15189, 15191, 15199, 15199, 15201, 15201, 15216, 15220, 15231, 15235, 15239, 15254, 15256, 15259, 15263, 15266, 15270, 15273, 15274]
        i = i+1
        props << Property.new({
          id: i,
          price: Random.rand(500..4000),
          address: "#{p} #{streets[Random.rand(0..3)]}",
          pictures: ["#{p}.0.jpg"],
          bedrooms: Random.rand(0..8),
          bathrooms: Random.rand(0..5),
          area: areas[Random.rand(0..areas.count-1)],
          year_built: Random.rand(1955..2013)
        })
        
      end
      props
    end



end
