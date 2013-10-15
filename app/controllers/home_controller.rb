class HomeController < ApplicationController
  layout 'home'
  def index
    @featured_properties = []
    PropertyManager.featured_properties.each do |p|
      @featured_properties << ViewModels::PropertyViewModel.home_page_view(p)
    end
    all_areas = PropertyManager.all_areas
    @all_areas_construct = []
    for area in all_areas
      @all_areas_construct << { 
        name: area,
        properties: [
          {title: 'For Sale', property: ViewModels::PropertyViewModel.home_page_view(PropertyManager.for_sale_in(area).last)},
          {title: 'Over $500k', property: ViewModels::PropertyViewModel.home_page_view(PropertyManager.over_500k_in(area).first)},
          {title: 'New Development' ,property: ViewModels::PropertyViewModel.home_page_view(PropertyManager.new_dev_in(area).last)}
        ]
      }
    end
  	
  end
  def angular_directives
  end
  def about
    render layout: 'application'
  end
end
