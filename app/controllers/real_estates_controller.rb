class RealEstatesController < ApplicationController
  before_action :authenticate_user!, only: %i[ add_to_favorite edit create update destroy ]
  before_action :set_real_estate, only: %i[ add_to_favorite show edit update destroy ]
  before_action :store_user_location!, if: :storable_location?

  # GET /real_estates or /real_estates.json
  def index
    redirect_to root_path
  end

  # GET /real_estates/1 or /real_estates/1.json
  def show
  end

  # GET /real_estates/new
  def new
    authenticate_user! unless user_signed_in?
    @real_estate = RealEstate.new
  end

  # GET /real_estates/1/edit
  def edit
  end

  # POST /real_estates or /real_estates.json
  def create
    @real_estate = RealEstate.new(real_estate_params)

    respond_to do |format|
      if @real_estate.save
        format.html { redirect_to root_path, notice: "Real estate was successfully created." }
        format.json { render :show, status: :created, location: @real_estate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_estates/1 or /real_estates/1.json
  def update
    respond_to do |format|
      if @real_estate.update(real_estate_params)
        format.html { redirect_to real_estate_url(@real_estate), notice: "Real estate was successfully updated." }
        format.json { render :show, status: :ok, location: @real_estate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estates/1 or /real_estates/1.json
  def destroy
    @real_estate.destroy!

    respond_to do |format|
      format.html { redirect_to real_estates_url, notice: "Real estate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_to_favorite
    user = User.find(current_user.id)
    user.real_estates << @real_estate if user.real_estates.where(id: @real_estate.id).first.blank?
    redirect_to :real_estate
  end

  def remove_from_favorite
    user = User.find(current_user.id)
    user.real_estates.delete(params[:id])
    redirect_to :favorites
  end

  def search
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate
      @real_estate = RealEstate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def real_estate_params
      authenticate_user! unless user_signed_in?
      params.require(:real_estate).permit(:name, :description, :price, :phone_number, :user_id)
            .with_defaults(user_id: current_user.id)
    end

  def storable_location?
    request.get? &&
      is_navigational_format? &&
      !devise_controller? &&
      !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope)
  end
end
