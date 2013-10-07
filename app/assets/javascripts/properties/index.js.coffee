Index = angular.module('Index', ['Server', 'ngRoute','GinevDirectives', 'ui.bootstrap'])
angular.module('Index').service('unitsCache', ->
    units = null
    area = null
    return {
      area : area
      units: units
    }
  )
angular.module('Index').controller 'IndexCtrl', ($scope, server, units, $routeParams, unitsCache)->
  
  $scope.slidingMin = 0
  $scope.slidingMax = 0
  $scope.showProgressBar = -> !unitsCache.units || unitsCache.area != $routeParams.id
  if !unitsCache.units || unitsCache.area != $routeParams.id
    unitsCache.units = new units() 
    unitsCache.area = $routeParams.id
  $scope.units = unitsCache.units
  $scope.filters = $scope.units.filters
  $scope.pagination = $scope.units.pagination

  $scope.units.applyFilters()
  unless $scope.units.unitsLoaded()
    $scope.units.load(window.propertiesToGet)
  $scope.$watch 'units.filters.inRangeIndexes[0] | json',->
    $scope.currentPage = $scope.units.currentPage()
    $scope.units.applyFilters()

  $scope.bathroomsSliderChange = (values)->
    $scope.filters.ranges.bathrooms.current[0] = values.lo
    $scope.filters.ranges.bathrooms.current[1] = values.hi
    $scope.units.applyFilters()
    updatePage()
  $scope.priceSliderChange = (values)->
    $scope.units.filters.ranges.price.current[0] = $scope.filters.ranges.price.current[0] = values.lo
    $scope.filters.ranges.price.current[1] = values.hi
    $scope.units.applyFilters()
    updatePage()
  $scope.bedroomsSliderChange = (values)->
    $scope.filters.ranges.bedrooms.current[0] = values.lo
    $scope.filters.ranges.bedrooms.current[1] = values.hi
    $scope.units.applyFilters()
    updatePage()

  $scope.pageSliderChange = (values)->
    $scope.pagination.currentPage = values.lo
    updatePage()
  updatePage = ->
    $scope.$apply ->  
      $scope.currentPage = $scope.units.currentPage()
  
  $scope.$watch 'pagination.currentPage + pagination.numPerPage',->
    $scope.currentPage = $scope.units.currentPage()

  $scope.$watch 'units.filters.orderBy',->
    $scope.units.resort()
    $scope.currentPage = $scope.units.currentPage()

  $scope.changePage = (pNum)-> 
    $scope.pagination.currentPage = pNum
    $scope.currentPage = $scope.units.page(pNum)

  $scope.reverseOrder = ->
    $scope.filters.reverseIt = !$scope.filters.reverseIt
    $scope.units.resort()
    $scope.units.applyFilters()
    $scope.currentPage = $scope.units.currentPage()
