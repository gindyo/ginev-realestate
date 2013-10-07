class PropertiesController<ApplicationController
  def index
    @header = 'all'
    @header = params[:p].gsub('_', ' ') if params[:p]
    @properties_to_get = params[:p]
  end

  def all
    area_units = []
    PropertyManager.all.each do |p|
      area_units << ViewModels::PropertyViewModel.results_page_view(p)
    end
    meta = {
              img_domain: 'http://www.realtimerental.com/rrv10/rentalphotos/15/',
              id: 0,
              price: 1,
              picture: 2,
              bedrooms: 3,
              bathrooms: 4,
              address: 5
            } 
    render json:  {meta: meta, units: area_units}
  end

  def for_rent
    area_units = []
    PropertyManager.for_rent.each do |p|
      area_units << ViewModels::PropertyViewModel.results_page_view(p)
    end
    meta = {
              img_domain: 'http://www.realtimerental.com/rrv10/rentalphotos/15/',
              id: 0,
              price: 1,
              picture: 2,
              bedrooms: 3,
              bathrooms: 4,
              address: 5
            } 
    render json:  {meta: meta, units: area_units}
  end

  def for_sale
      area_units = []
      PropertyManager.all.each do |p|
        area_units << ViewModels::PropertyViewModel.results_page_view(p)
      end
      meta = {
                img_domain: 'http://www.realtimerental.com/rrv10/rentalphotos/15/',
                id: 0,
                price: 1,
                picture: 2,
                bedrooms: 3,
                bathrooms: 4,
                address: 5
              } 
      render json:  {meta: meta, units: area_units}
    end


end