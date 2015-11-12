class BigqueriesController < ApplicationController
  before_action :set_bigquery, only: [:show, :edit, :update, :destroy]

  # GET /bigqueries
  # GET /bigqueries.json
  def index
    render json: Elecapp.all   
  end

  # GET /bigqueries/1
  # GET /bigqueries/1.json
  def show
  end

  # GET /bigqueries/new
  def new
    @bigquery = Bigquery.new
  end

  # GET /bigqueries/1/edit
  def edit
  end

  # POST /bigqueries
  # POST /bigqueries.json
  def create
    @bigquery = Bigquery.new(bigquery_params)

    respond_to do |format|
      if @bigquery.save
        format.html { redirect_to @bigquery, notice: 'Bigquery was successfully created.' }
        format.json { render :show, status: :created, location: @bigquery }
      else
        format.html { render :new }
        format.json { render json: @bigquery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bigqueries/1
  # PATCH/PUT /bigqueries/1.json
  def update
    respond_to do |format|
      if @bigquery.update(bigquery_params)
        format.html { redirect_to @bigquery, notice: 'Bigquery was successfully updated.' }
        format.json { render :show, status: :ok, location: @bigquery }
      else
        format.html { render :edit }
        format.json { render json: @bigquery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bigqueries/1
  # DELETE /bigqueries/1.json
  def destroy
    @bigquery.destroy
    respond_to do |format|
      format.html { redirect_to bigqueries_url, notice: 'Bigquery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bigquery
      @bigquery = Bigquery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bigquery_params
      params.require(:bigquery).permit(:text, :number)
    end
end
