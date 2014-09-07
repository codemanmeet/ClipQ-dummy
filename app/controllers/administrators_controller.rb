class AdministratorsController < ApplicationController

before_action :authenticate_user, :only => [:index, :settings]
respond_to :json, :html

	
end
