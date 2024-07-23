class TodoWithPleasesController < ApplicationController
  before_action :set_todo_with_please, only: %i[ show edit update destroy ]

  # GET /todo_with_pleases or /todo_with_pleases.json
  def index
    @todo_with_pleases = TodoWithPlease.all
  end

  # GET /todo_with_pleases/1 or /todo_with_pleases/1.json
  def show
  end

  # GET /todo_with_pleases/new
  def new
    @todo_with_please = TodoWithPlease.new
  end

  # POST /todo_with_pleases/redo
  def redo
    @todo_with_please = TodoWithPlease.new(todo_with_please_params)

    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @todo_with_please.errors, status: :unprocessable_entity }
    end
  end

  # GET /todo_with_pleases/1/edit
  def edit
  end

  # POST /todo_with_pleases or /todo_with_pleases.json
  def create
    @todo_with_please = TodoWithPlease.new(todo_with_please_params)

    respond_to do |format|
      if params[:please] == "please"
        if @todo_with_please.save
          format.html { redirect_to todo_url(@todo_with_please), notice: "Todo With Please was successfully created." }
          format.json { render :show, status: :created, location: @todo_with_please }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @todo_with_please.errors, status: :unprocessable_entity }
        end
      else
        if @todo_with_please.valid?
          format.html { render :confirm, status: :accepted }
          format.json { render :show, status: :accepted }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @todo_with_please.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /todo_with_pleases/1 or /todo_with_pleases/1.json
  def update
    respond_to do |format|
      if @todo_with_please.update(todo_with_please_params)
        format.html { redirect_to todo_with_please_url(@todo_with_please), notice: "Todo with please was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_with_please }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_with_please.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_with_pleases/1 or /todo_with_pleases/1.json
  def destroy
    @todo_with_please.destroy!

    respond_to do |format|
      format.html { redirect_to todo_with_pleases_url, notice: "Todo with please was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_with_please
      @todo_with_please = TodoWithPlease.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_with_please_params
      params.require(:todo_with_please).permit(:body, :finished)
    end
end
