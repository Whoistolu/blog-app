# _string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all

    json_response(@users)
  end

  def show
    @user = User.find(params[:id])

    json_response(set_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
