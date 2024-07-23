class TodoWithSigsController < ApplicationController
  before_action :set_todo_with_sig, only: %i[ show edit update destroy ]

  # GET /todo_with_sigs or /todo_with_sigs.json
  def index
    @todo_with_sigs = TodoWithSig.all
  end

  # GET /todo_with_sigs/1 or /todo_with_sigs/1.json
  def show
  end

  # GET /todo_with_sigs/new
  def new
    @todo_with_sig = TodoWithSig.new
  end

  # POST /todo_with_sigs/redo
  def redo
    @todo_with_sig = TodoWithSig.new(todo_with_sig_params)

    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @todo_with_sig.errors, status: :unprocessable_entity }
    end
  end

  # GET /todo_with_sigs/1/edit
  def edit
  end

  # POST /todo_with_sigs or /todo_with_sigs.json
  def confirm
    @todo_with_sig = TodoWithSig.new(todo_with_sig_params)

    respond_to do |format|
      if @todo_with_sig.valid?
        format.html { render :confirm, status: :accepted }
        format.json { render :show, status: :accepted }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_with_sig.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /todo_with_sigs or /todo_with_sigs.json
  def create
    @todo_with_sig = TodoWithSig.new(todo_with_sig_params)

    respond_to do |format|
      if @todo_with_sig.verify_signature(params[:sig])
        if @todo_with_sig.save
          format.html { redirect_to todo_with_sig_url(@todo_with_sig), notice: "Todo with sig was successfully created." }
          format.json { render :show, status: :created, location: @todo_with_sig }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @todo_with_sig.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_with_please.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_with_sigs/1 or /todo_with_sigs/1.json
  def update
    respond_to do |format|
      if @todo_with_sig.update(todo_with_sig_params)
        format.html { redirect_to todo_with_sig_url(@todo_with_sig), notice: "Todo with sig was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_with_sig }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_with_sig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_with_sigs/1 or /todo_with_sigs/1.json
  def destroy
    @todo_with_sig.destroy!

    respond_to do |format|
      format.html { redirect_to todo_with_sigs_url, notice: "Todo with sig was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_with_sig
      @todo_with_sig = TodoWithSig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_with_sig_params
      params.require(:todo_with_sig).permit(:body, :finished, :signature)
    end
end
