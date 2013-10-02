angular.module('Server', []).service 'server', ($http)->
  areaUnits = (id, callback)->
    returnedData = null
    url = '/properties/area/'+id
    $http.get(url).
      success (data)=>
        callback data
      
    return returnedData
  allAreas = (callback)->
    $http.get('/properties/all')
    .success (data, status)=>
        callback data
  getUnit = (id, callback)->
    $http.get('/properties/'+id)
    .success (data, status)=>
        callback data

  return {
    areaUnits: areaUnits
    allAreas: allAreas
    getUnit: getUnit
  }