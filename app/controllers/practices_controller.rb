class PracticesController < ApplicationController
  before_action :authenticate_practice!

  def new
  end
end
