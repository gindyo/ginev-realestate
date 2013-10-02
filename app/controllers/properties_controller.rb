class PropertiesController<ApplicationController
  def index
    
  end

  def area
    debugger
    area_units = Properties.area_units params[:area_id]
    render json:  area_units
  end

private
  def repo
    return Repo.new
  end

end