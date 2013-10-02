class HomeController < ApplicationController
  layout 'home'
  def index
    @featured_properties = Properties.get_featured()
  	@sections = Properties.get_sections
  end
  def angular_directives

  end
  def about
    render layout: 'application'
  end

end
