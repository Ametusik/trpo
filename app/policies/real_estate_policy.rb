# frozen_string_literal: true

class RealEstatePolicy < ApplicationPolicy
  attr_reader :user, :real_estate

  def initialize(user, real_estate)
    @user = user
    @real_estate = real_estate
  end

  def create?
    true
  end

  def update?
    @user.real_estates.where(id: @real_estate.id).first.present? || @user.admin?
  end

  def destroy?
    @user.real_estates.where(id: @real_estate.id).first.present? || @user.admin?
  end

  def revalidate_real_estate?
    @user.admin?
  end

end
