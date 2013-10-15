@angular.module('GinevDirectives')
  .directive 'reUnit', ->
    restrict: 'A'
    scope: {
      unit: '='
      onUnitClicked: '&'
      unitWidth: '='
    }
    template: '
      <div class="unit">
        <span class="unit-bdba">{{unit.bathrooms}}ba/{{unit.bedrooms}}bd</span>
        <div class="unit-prop-img"><a href="/properties/{{unit.id}}"><img ng-src="{{unit.picture}}"></a></div>
        <h4 class="unit-price"><a href="/properties/{{unit.id}}">${{unit.price | number}}</a></h4>
        <h5 class="unit-address"><a href="/properties/{{unit.id}}">{{unit.address}}</a></h5>
      </div>

    '
    link: ->
      return
    

