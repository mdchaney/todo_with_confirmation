class TodoWithConfirmsController < ApplicationController
  before_action :set_todo_with_confirm, only: %i[ show edit update destroy ]

  # GET /todo_with_confirms or /todo_with_confirms.json
  def index
    @todo_with_confirms = TodoWithConfirm.all
  end

  # GET /todo_with_confirms/1 or /todo_with_confirms/1.json
  def show
  end

  # GET /todo_with_confirms/new
  def new
    @todo_with_confirm = TodoWithConfirm.new
  end

  # POST /todo_with_confirms/redo
  def redo
    @todo_with_confirm = TodoWithConfirm.new(todo_with_confirm_params)

    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @todo_with_confirm.errors, status: :unprocessable_entity }
    end
  end

  # GET /todo_with_confirms/1/edit
  def edit
  end

  # POST /todo_with_confirms or /todo_with_confirms.json
  def confirm
    @todo_with_confirm = TodoWithConfirm.new(todo_with_confirm_params)

    respond_to do |format|
      if @todo_with_confirm.valid?
        format.html { render :confirm, status: :accepted }
        format.json { render :show, status: :accepted }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_with_confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /todo_with_confirms or /todo_with_confirms.json
  def create
    @todo_with_confirm = TodoWithConfirm.new(todo_with_confirm_params)

    respond_to do |format|
      if @todo_with_confirm.save
        format.html { redirect_to todo_with_confirm_url(@todo_with_confirm), notice: "Todo with confirm was successfully created." }
        format.json { render :show, status: :created, location: @todo_with_confirm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_with_confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_with_confirms/1 or /todo_with_confirms/1.json
  def update
    respond_to do |format|
      if @todo_with_confirm.update(todo_with_confirm_params)
        format.html { redirect_to todo_with_confirm_url(@todo_with_confirm), notice: "Todo with confirm was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_with_confirm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_with_confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_with_confirms/1 or /todo_with_confirms/1.json
  def destroy
    @todo_with_confirm.destroy!

    respond_to do |format|
      format.html { redirect_to todo_with_confirms_url, notice: "Todo with confirm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_with_confirm
      @todo_with_confirm = TodoWithConfirm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_with_confirm_params
      params.require(:todo_with_confirm).permit(:body, :finished)
    end
end
