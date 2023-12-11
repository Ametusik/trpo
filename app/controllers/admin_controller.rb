class AdminController < ApplicationController
  def index
    @real_estates = RealEstate.all
    authorize @real_estates.first, policy_class: AdminPolicy
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end
end
