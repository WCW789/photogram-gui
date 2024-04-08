class HomeController < ApplicationController
  def homepage
    @list_of_users = User.all.order({ :created_at => :desc })

    render({ :template => "homepage"})
  end
end
