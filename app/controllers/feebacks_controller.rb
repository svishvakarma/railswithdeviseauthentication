class FeebacksController < ApplicationController
  before_action :set_feeback, only: %i[ show edit update destroy ]

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

    respond_to do |format|
      if @feeback.save
        format.html { redirect_to feeback_url(@feeback), notice: "Feeback was successfully created." }
        format.json { render :show, status: :created, location: @feeback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feeback.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feeback.update(feeback_params)
        format.html { redirect_to feeback_url(@feeback), notice: "Feeback was successfully updated." }
        format.json { render :show, status: :ok, location: @feeback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feeback.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feeback.destroy

    respond_to do |format|
      format.html { redirect_to feebacks_url, notice: "Feeback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_feeback
      @feeback = Feeback.find(params[:id])
    end

    def feeback_params
      params.fetch(:feeback, {})
    end
end
