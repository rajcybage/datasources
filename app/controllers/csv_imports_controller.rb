class CsvImportsController < ApplicationController
  before_action :set_csv_import, only: [:show, :edit, :update, :destroy]
  before_action :remove_all_imports, only: :import

  # GET /csv_imports
  # GET /csv_imports.json
  def index
    @csv_imports = CsvImport.all
  end

  def import
    CsvImport.import(params[:file])
    redirect_to root_url, notice: "CSV Uploaded"
  end
  # GET /csv_imports/1
  # GET /csv_imports/1.json
  def show
  end

  # GET /csv_imports/new
  def new
    @csv_import = CsvImport.new
  end

  # GET /csv_imports/1/edit
  def edit
  end

  # POST /csv_imports
  # POST /csv_imports.json
  def create
    @csv_import = CsvImport.new(csv_import_params)

    respond_to do |format|
      if @csv_import.save
        format.html { redirect_to @csv_import, notice: 'Csv import was successfully created.' }
        format.json { render :show, status: :created, location: @csv_import }
      else
        format.html { render :new }
        format.json { render json: @csv_import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csv_imports/1
  # PATCH/PUT /csv_imports/1.json
  def update
    @import = CsvImport.find_by(id: params[:id])
    @import.csv_values[params["format"]] =  params["value"]
    # ActiveRecord::Base.record_timestamps = false
    @import.save!
    redirect_to root_url, notice: "Value has been Updated."
  end

  # DELETE /csv_imports/1
  # DELETE /csv_imports/1.json
  def destroy
    @csv_import.destroy
    respond_to do |format|
      format.html { redirect_to csv_imports_url, notice: 'Csv import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csv_import
      @csv_import = CsvImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csv_import_params
      params.require(:csv_import).permit(:data)
    end
    
    #Due to less memry in Database We have to do it you can skip it in before action
    def remove_all_imports
      CsvImport.destroy_all
    end  
end
