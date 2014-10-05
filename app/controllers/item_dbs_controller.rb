class ItemDbsController < ApplicationController
  before_action :set_item_db, only: [:show, :edit, :update, :destroy]

  # GET /item_dbs
  # GET /item_dbs.json
  def index
    @item_dbs = ItemDb.all
  end

  # GET /item_dbs/1
  # GET /item_dbs/1.json
  def show
  end

  # GET /item_dbs/new
  def new
    @item_db = ItemDb.new
  end

  # GET /item_dbs/1/edit
  def edit
  end

  # POST /item_dbs
  # POST /item_dbs.json
  def create
    @item_db = ItemDb.new(item_db_params)

    respond_to do |format|
      if @item_db.save
        format.html { redirect_to @item_db, notice: 'Item db was successfully created.' }
        format.json { render :show, status: :created, location: @item_db }
      else
        format.html { render :new }
        format.json { render json: @item_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_dbs/1
  # PATCH/PUT /item_dbs/1.json
  def update
    respond_to do |format|
      if @item_db.update(item_db_params)
        format.html { redirect_to @item_db, notice: 'Item db was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_db }
      else
        format.html { render :edit }
        format.json { render json: @item_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_dbs/1
  # DELETE /item_dbs/1.json
  def destroy
    @item_db.destroy
    respond_to do |format|
      format.html { redirect_to item_dbs_url, notice: 'Item db was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_db
      @item_db = ItemDb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_db_params
      params.require(:item_db).permit(:data, :patch_version, :fetch_version)
    end
end
