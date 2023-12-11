# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  attr_reader :user, :real_estate

  def initialize(user, real_estate)
    @user = user
    @real_estate = real_estate
  end

  def index?
    @user.role == "admin"
  end
end
