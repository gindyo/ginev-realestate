angular.module('Server', []).service 'server', ($http)->
  getProperties = (properties_type, callback)->
    returnedData = null
    url = '/properties/'+properties_type
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
    getProperties: getProperties
    allAreas: allAreas
    getUnit: getUnit
  }