angular.module('Index').factory 'units', ['server', (server)->
  units = ->  
    all = []
    meta = {}
    filters = {}
    
    pagination = {}

    convertToUnit = (u)->
      unit = {}
      unit.id = u[meta.id]
      unit.price = u[meta.price]
      unit.picture = if u[meta.picture][0] != '/' then meta.img_domain + u[meta.picture] else u[meta.picture]
      unit.bedrooms = u[meta.bedrooms]
      unit.bathrooms = u[meta.bathrooms]
      unit.address = u[meta.address]
      unit

    load = (properties_type, callback)->
      window.units = []
      server.getProperties (properties_type || 'all'), (data)->
        for u in data.units 
          all.push u  
          window.units.push u
        meta = data.meta
        price_edges = getEdges(data.units, 'price')
        bathrooms_edges = getEdges(data.units, 'bathrooms')
        bedrooms_edges = getEdges(data.units, 'bedrooms')
        filters.ranges.price.current = [price_edges[0], price_edges[1]]
        filters.ranges.price.edges = [price_edges[0], price_edges[1]]
        filters.ranges.bathrooms.current = [bathrooms_edges[0], bathrooms_edges[1]]
        filters.ranges.bathrooms.edges = [bathrooms_edges[0], bathrooms_edges[1]]
        filters.ranges.bedrooms.current = [bedrooms_edges[0], bedrooms_edges[1]]
        filters.ranges.bedrooms.edges = [bedrooms_edges[0], bedrooms_edges[1]]
        callback() if callback
        applyFilters()
        sortUnits()
        return
   
    allUnits = ->
      units = []
      for u in all 
        units.push convertToUnit u
      units
    
    calculateNumOfPages = ->
      if filters.inRangeIndexes && filters.inRangeIndexes && filters.inRangeIndexes.length > pagination.numPerPage 
        Math.ceil(filters.inRangeIndexes.length / pagination.numPerPage) 
      else
        1 
    
    pagination = {
      totalUnits: ->all.length
      currentPage: 1
      numPerPage: 8
    }
    pagination['numOfPages'] = 3

    filters['reverseIt'] = false

    filters = {
      orderBy: 'price'
      orderDirection: -> 
        if @reverseIt then 'down' else 'up'
      inRangeIndexes: []
      ranges: {
        price: {
          edges: []
          current: []
        }
        bathrooms: {
          edges: []
          current: []
        }
        bedrooms: {
          edges: []
          current: []
        }
      }
    }
    isInRange = (el)->
      el['price'] >= filters.ranges.price.current[0] &&
      el['price'] <= filters.ranges.price.current[1] &&
      el['bathrooms'] >= filters.ranges.bathrooms.current[0]  &&
      el['bathrooms'] <= filters.ranges.bathrooms.current[1] &&
      el['bedrooms'] >= filters.ranges.bedrooms.current[0] &&
      el['bedrooms'] <= filters.ranges.bedrooms.current[1] 
    
    applyFilters = ->
      filters.inRangeIndexes = []
      for u, i in allUnits()
        if isInRange(u)
          filters.inRangeIndexes.push i 
      
    getEdges = (obj, field)->
      min = obj[0][meta[field]]
      max = obj[1][meta[field]]

      for el in obj
        if el[meta[field]]<min 
          min = el[meta[field]]
        if el[meta[field]] > max 
          max = el[meta[field]]
      [min, max]

   



    sortUnits = ()->
      if all.length > 0 
        all = mergeSort all, meta[filters.orderBy]
        if filters.reverseIt
          reversed = []
          for i in all
            reversed.push all.pop()
          all = reversed


    
    unitsInRange = ->
      units = []
      for i in filters.inRangeIndexes
        units.push all[i]
      units


    
    selectPage = (pNum)->
      pNum = pNum-1
      perPageUnits = parseInt(pagination.numPerPage)-1
      numPerPage = parseInt pagination.numPerPage
      pageUnits = []
      allu = allUnits()
      for i in[(pNum*numPerPage)..(pNum*numPerPage)+numPerPage-1] 
        if allu[filters.inRangeIndexes[i]]
          pageUnits.push allu[filters.inRangeIndexes[i]]
      pageUnits

    currentPage = ->
      selectPage(parseInt(pagination.currentPage))



    splitArr = (a)->
      midpoint = Math.floor a.length/2
      a1 = a.splice(midpoint, a.length-midpoint)
      [a1, a]
    

    mergeSort = (arr, pos)->
      sorted = []
      if arr.length == 1
        return arr
      else
        spl = splitArr(arr)
        left = spl[0]
        right = spl[1]
        m1 = mergeSort(left, pos)
        m2 = mergeSort(right, pos)
        while m1.length > 0 && m2.length > 0 
          if m1[0][pos] < m2[0][pos]
            sorted.push m1.shift()
          else 
            sorted.push m2.shift()
        if m1.length == 0
          while m2.length > 0
            sorted.push m2.shift()
          return sorted
        if m2.length == 0
          while m1.length > 0
            sorted.push m1.shift()
          return sorted
   
    return { 
      unitsLoaded: -> all.length > 0
      all:  allUnits()
      pagination:  pagination 
      resort:  sortUnits
      filters:  filters
      applyFilters:  applyFilters
      load:  load
      page:  selectPage
      currentPage:  currentPage
      mergeSort:  mergeSort
     
    }
  return units
]