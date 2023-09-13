class LandingpageController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @title = 'Budgetify'
  end
end
