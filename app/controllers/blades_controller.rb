class BladesController < ApplicationController
  before_action :set_blade, only: [:show, :edit, :update, :destroy]

  # GET /blades
  # GET /blades.json
  def index
    @blades = Blade.all.order("name")
  end

  # GET /blades/1
  # GET /blades/1.json
  def show
  end

  # GET /blades/new
  def new
    @blade = Blade.new
  end

  # GET /blades/1/edit
  def edit
  end

  # POST /blades
  # POST /blades.json
  def create
    @blade = Blade.new(blade_params)

    puts blade_params.inspect
    respond_to do |format|
      if @blade.save && create_catalogueblade(@blade)
        format.html { redirect_to @blade, notice: 'Blade was successfully created.' }
        format.json { render :show, status: :created, location: @blade }
      else
        format.html { render :new }
        format.json { render json: @blade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blades/1
  # PATCH/PUT /blades/1.json
  def update
    respond_to do |format|
      if @blade.update(blade_params)
        format.html { redirect_to @blade, notice: 'Blade was successfully updated.' }
        format.json { render :show, status: :ok, location: @blade }
      else
        format.html { render :edit }
        format.json { render json: @blade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blades/1
  # DELETE /blades/1.json
  def destroy
    @blade.destroy
    respond_to do |format|
      format.html { redirect_to blades_url, notice: 'Blade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blade
      @blade = Blade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blade_params
      params.require(:blade).permit(:name, :description, :price, :pointy, :stock, :image)
    end

    def create_catalogueblade(blade)
      @catalogueblade = blade.catalogueblades.build({blade: blade, catalogue: current_user.catalogue, quantity: blade.stock})

      if @catalogueblade.save
          return true
      else
          return false
      end
    end
end
