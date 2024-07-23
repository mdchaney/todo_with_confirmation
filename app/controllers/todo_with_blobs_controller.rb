class TodoWithBlobsController < ApplicationController
  before_action :set_todo_with_blob, only: %i[ show edit update destroy ]

  # GET /todo_with_blobs or /todo_with_blobs.json
  def index
    @todo_with_blobs = TodoWithBlob.all
  end

  # GET /todo_with_blobs/1 or /todo_with_blobs/1.json
  def show
  end

  # GET /todo_with_blobs/new
  def new
    @todo_with_blob = TodoWithBlob.new
  end

  # POST /todo_with_blobs/redo
  def redo
    @todo_with_blob = TodoWithBlob.new(todo_with_blob_params)

    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @todo_with_blob.errors, status: :unprocessable_entity }
    end
  end

  # GET /todo_with_blobs/1/edit
  def edit
  end

  # POST /todo_with_blobs or /todo_with_blobs.json
  def confirm
    @todo_with_blob = TodoWithBlob.new(todo_with_blob_params)

    respond_to do |format|
      if @todo_with_blob.valid?
        @blob = @todo_with_blob.as_encrypted_blob
        format.html { render :confirm, status: :accepted }
        format.json { render :show, status: :accepted }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_with_blob.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /todo_with_blobs or /todo_with_blobs.json
  def create
    @todo_with_blob = TodoWithBlob.from_encrypted_blob(params[:blob])

    respond_to do |format|
      if @todo_with_blob.save
        format.html { redirect_to todo_with_blob_url(@todo_with_blob), notice: "Todo with blob was successfully created." }
        format.json { render :show, status: :created, location: @todo_with_blob }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_with_blob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_with_blobs/1 or /todo_with_blobs/1.json
  def update
    respond_to do |format|
      if @todo_with_blob.update(todo_with_blob_params)
        format.html { redirect_to todo_with_blob_url(@todo_with_blob), notice: "Todo with blob was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_with_blob }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_with_blob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_with_blobs/1 or /todo_with_blobs/1.json
  def destroy
    @todo_with_blob.destroy!

    respond_to do |format|
      format.html { redirect_to todo_with_blobs_url, notice: "Todo with blob was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_with_blob
      @todo_with_blob = TodoWithBlob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_with_blob_params
      params.require(:todo_with_blob).permit(:body, :finished)
    end
end
