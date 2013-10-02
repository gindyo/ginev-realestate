module Repo
    def get_units search_params
    end

    def get_featured
      properties[0..4]
    end

    def get_sections
      titles = [
       'Sales and Rentals',
       'PROPERTIES ABOVE $500k',
       'NEW DEVELOPMENTS'
      ] 
      sections = []
      i = 0
      for p in [15001, 15093, 15028]
        sections.push ({title: titles[i], unit:{address: "#{p} Main str.", img: 'http://www.realtimerental.com/rrv10/rentalphotos/15/'+p.to_s+'.0.jpg'}})
        i = i+1
      end
      puts sections
      sections
    end

    def all_areas
      data =  [      
        
        {city: 'Ventnor, NJ', url: 'areas/1'},
        {city: 'Brigantine, NJ', url: 'areas/2'},
        {city: 'Margate, NJ', url: 'areas/3'},
        {city: 'Atlantic city, NJ', url: 'areas/4'},
        {city: 'Ocean city, NJ', url: 'areas/5'},
        {city: 'Absecon, NJ', url: 'areas/6'},
        {city: 'Vineland, NJ', url: 'areas/7'}
      ]
     
    end
    def area_units id
      units = []
      if id.to_i != 0  
      else
        for p in [15001, 15024, 15025, 15028, 15060, 15084, 15085, 15086, 15087, 15088, 15089, 15093, 15093, 15117, 15127, 15131, 15137, 15137, 15137, 15139, 15140, 15143, 15145, 15151, 15151, 15156, 15156, 15157, 15157, 15164, 15169, 15187, 15189, 15191, 15199, 15199, 15201, 15201, 15216, 15220, 15231, 15235, 15239, 15254, 15256, 15259, 15263, 15266, 15270, 15273, 15274, 15279, 15281, 15286, 15287, 15292, 15303, 15306, 15308, 15316, 15316, 15318, 15319, 15324, 15326, 15327, 15329, 15329, 15330, 15332, 15332, 15335, 15336, 15337, 15338, 15345, 15346, 15346, 15347, 15353, 15356, 15356, 15362, 15364, 15365, 15365, 15369, 15369, 15373, 15373, 15374, 15374, 15377, 15379, 15381, 15382, 15383, 15385, 15385, 15388, 15388, 15404, 15407, 15408, 15411, 15412, 15413, 15413, 15414, 15415, 15418, 15420, 15422, 15423, 15425, 15427, 15427, 15433, 15433, 15434, 15437, 15438, 15440, 15441, 15444, 15447, 15450, 15453, 15456, 15458, 15460, 15464, 15468, 15470, 15472, 15473, 15475, 15475, 15486, 15487, 15509, 15510, 15516, 15523, 15532, 15539, 15541, 15541, 15557, 15560, 15565, 15568, 15573, 15574, 15580, 15582, 15591, 15616, 15618, 15619, 15629, 15632, 15632, 15635, 15639, 15639, 15643, 15660, 15668, 15668, 15671, 15683, 15684, 15688, 15758, 15775, 15818, 15837, 15855, 15873, 15873, 15914, 15929, 15943, 15943, 15966, 15969, 15976, 15977] do
           units.push ([p, Random.rand(0..700000), p.to_s+'.0.TH.jpg', Random.rand(0..7), Random.rand(0..8), '1 main'])
        end
      end
     meta = {
              img_domain: 'http://www.realtimerental.com/rrv10/rentalphotos/15/',
              id: 0,
              price: 1,
              img_url: 2,
              bedrooms: 3,
              bathrooms: 4,
              address: 5
            } 
     data = {meta: meta, units: units}
    end

    def unit id
      pictures = []
      for i in (0..5) do
        pictures.push "#{id}.#{i}.jpg"
      end 

      unit = []
      unit[0] = pictures

      meta = {
        imgDomain: 'http://www.realtimerental.com/rrv10/rentalphotos/15/',
        pictures: 0
      }
      
      data = {meta: meta, unit: unit}
    end

    private 

    def properties
      props = [
        {price: 1000000, address: '123 Main str.', img_url: '/assets/1.jpg', bedrooms: 5, bathrooms: 3, city: 'Margate'},
        {price: 10000000, address: '123 Main str.', img_url: '/assets/5.jpg', bedrooms: 5, bathrooms: 3, city: 'Ventnor'},
        {price: 300000, address: '123 Main str.', img_url: '/assets/2.jpg', bedrooms: 5, bathrooms: 3, city: 'Ocean City'},
        {price: 12000000, address: '123 Main str.', img_url: '/assets/4.jpg', bedrooms: 5, bathrooms: 3, city: 'Brigantine'},
        {price: 4000000, address: '123 Main str.', img_url: '/assets/3.jpg', bedrooms: 5, bathrooms: 3, city: 'Longport'}
      ]
      for p in [15001, 15024, 15025, 15028, 15060, 15084, 15085, 15086, 15087, 15088, 15089, 15093, 15093, 15117, 15127, 15131, 15137, 15137, 15137, 15139, 15140, 15143, 15145, 15151, 15151, 15156, 15156, 15157, 15157, 15164, 15169, 15187, 15189, 15191, 15199, 15199, 15201, 15201, 15216, 15220, 15231, 15235, 15239, 15254, 15256, 15259, 15263, 15266, 15270, 15273, 15274, 15279, 15281, 15286, 15287, 15292, 15303, 15306, 15308, 15316, 15316, 15318, 15319, 15324, 15326, 15327, 15329, 15329, 15330, 15332, 15332, 15335, 15336, 15337, 15338, 15345, 15346, 15346, 15347, 15353, 15356, 15356, 15362, 15364, 15365, 15365, 15369, 15369, 15373, 15373, 15374, 15374, 15377, 15379, 15381, 15382, 15383, 15385, 15385, 15388, 15388, 15404, 15407, 15408, 15411, 15412, 15413, 15413, 15414, 15415, 15418, 15420, 15422, 15423, 15425, 15427, 15427, 15433, 15433, 15434, 15437, 15438, 15440, 15441, 15444, 15447, 15450, 15453, 15456, 15458, 15460, 15464, 15468, 15470, 15472, 15473, 15475, 15475, 15486, 15487, 15509, 15510, 15516, 15523, 15532, 15539, 15541, 15541, 15557, 15560, 15565, 15568, 15573, 15574, 15580, 15582, 15591, 15616, 15618, 15619, 15629, 15632, 15632, 15635, 15639, 15639, 15643, 15660, 15668, 15668, 15671, 15683, 15684, 15688, 15758, 15775, 15818, 15837, 15855, 15873, 15873, 15914, 15929, 15943, 15943, 15966, 15969, 15976, 15977] do
        props << {
          price: Random.rand(0..7000000),
          address: "#{p} main",
          img_url: "http://www.realtimerental.com/rrv10/rentalphotos/15/#{p}.0.jpg }",
          bedrooms: Random.rand(0..8),
          bathrooms: Random.rand(0..5)
        }
        #props.push ([p, Random.rand(0..700000), p.to_s+'.0.TH.jpg', Random.rand(0..7), Random.rand(0..8), '1 main'])
      end
      props
    end


end
