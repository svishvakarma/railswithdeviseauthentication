class FeebacksController < ApplicationController
  before_action :set_feeback, only: %i[ show edit update destroy ]
  before_action :authorize_request

  def index
    @feebacks = Feeback.all
  end

  def show
  end

  def new
    @feeback = Feeback.new
  end

  def edit
  end

  def create
    @feeback = Feeback.new(feeback_params)

      if @feeback.save
        render json: {message: 'feeback save'}
      else
        render json: {message: 'unauthorised'}
      end
  end

  private
    def set_feeback
      @feeback = Feeback.find(params[:id])
    end

    def feeback_params
      params.permit(:star_count)
    end
end
