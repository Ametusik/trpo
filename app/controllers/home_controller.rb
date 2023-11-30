class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[ my favorites ]
  protect_from_forgery prepend: true

  def index
    @real_estates = RealEstate.all

    @real_estates = @real_estates.where(name: params[:name]) unless params[:name].blank?
    @real_estates = @real_estates.where(description: params[:description]) unless params[:description].blank?
    @real_estates = @real_estates.where(price: params[:price]) unless params[:price].blank?
    @real_estates = @real_estates.where(phone_number: params[:phone_number]) unless params[:phone_number].blank?
  end

  def my
    @real_estates = RealEstate.where(user_id: current_user.id)
  end

  def favorites
    @real_estates = User.find(current_user.id).real_estates
  end

end
