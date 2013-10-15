class PropertiesController<ApplicationController
  layout 'home' , only: :show
  def index
    @header = 'all'
    @header = params[:p].gsub('_', ' ') if params[:p]
    @properties_to_get = params[:p]
  end

  def all
    render json: contstruct_json_response(PropertyManager.all )
  end

  def for_rent
    render json: contstruct_json_response(PropertyManager.for_rent )
  end

  def for_sale
    render json: contstruct_json_response(PropertyManager.for_sale )
  end
  def show
    prop = PropertyManager.property params[:id]
    @property = ViewModels::PropertyViewModel.property_page_view(prop)
  end


  private
  def contstruct_json_response properties
    area_units = []
    properties.each do |p|
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
    {meta: meta, units: area_units}
  end

end