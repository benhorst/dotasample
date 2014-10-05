class HeroDbsController < ApplicationController
  before_action :set_hero_db, only: [:show, :edit, :update, :destroy]

  # GET /hero_dbs
  # GET /hero_dbs.json
  def index
    @hero_dbs = HeroDb.all
  end

  # GET /hero_dbs/1
  # GET /hero_dbs/1.json
  def show
  end

  # GET /hero_dbs/new
  def new
    @hero_db = HeroDb.new
  end

  # GET /hero_dbs/1/edit
  def edit
  end

  # POST /hero_dbs
  # POST /hero_dbs.json
  def create
    @hero_db = HeroDb.new(hero_db_params)

    respond_to do |format|
      if @hero_db.save
        format.html { redirect_to @hero_db, notice: 'Hero db was successfully created.' }
        format.json { render :show, status: :created, location: @hero_db }
      else
        format.html { render :new }
        format.json { render json: @hero_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hero_dbs/1
  # PATCH/PUT /hero_dbs/1.json
  def update
    respond_to do |format|
      if @hero_db.update(hero_db_params)
        format.html { redirect_to @hero_db, notice: 'Hero db was successfully updated.' }
        format.json { render :show, status: :ok, location: @hero_db }
      else
        format.html { render :edit }
        format.json { render json: @hero_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hero_dbs/1
  # DELETE /hero_dbs/1.json
  def destroy
    @hero_db.destroy
    respond_to do |format|
      format.html { redirect_to hero_dbs_url, notice: 'Hero db was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero_db
      @hero_db = HeroDb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_db_params
      params.require(:hero_db).permit(:data, :patch_version, :fetch_version)
    end
end
