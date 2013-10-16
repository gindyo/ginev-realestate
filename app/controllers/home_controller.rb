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
          {title: 'For Sale', property: home_page_view(:for_sale_in, area, 'first')},
          {title: 'Over $500k', property: home_page_view(:over_500k_in, area, 'last')},
          {title: 'New Development' ,property: home_page_view(:new_dev_in, area, 'first')}
        ]
      }
    end
    
  end
  def angular_directives
  end
  def about
    render layout: 'application'
  end

  private
  def home_page_view type, area, element
    ViewModels::PropertyViewModel.home_page_view(PropertyManager.send(type, area).send(element))
  end
end
