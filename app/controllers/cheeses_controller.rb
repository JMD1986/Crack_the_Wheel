class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update, :destroy]

  # GET /cheeses
  # GET /cheeses.json
  def index
    @cheeses = Cheese.all
#    I need to figure out whats going on here
    @farms = Farm.all
  end

  # GET /cheeses/1
  # GET /cheeses/1.json
  def show
    authenticate_user!
    @reviews = Review.where(cheese_id: params[:id])
    @review = Review.new
    @wheel_scale = [1, 2, 3, 4, 5]

  end

  # GET /cheeses/new
  def new
    authenticate_user!
    @cheese = Cheese.new
    farm_options = Farm.all
    @farm_names = []
    farm_options.each do |farm|
    @farm_names << [farm.name, farm.id]
    end

    # reviews = Review.where(cheese_id: params[:id])
    # @wheels_array = []
    # reviews.each do |review|
    #   @wheels_array.push(review.wheel)
    # end
    # @wheels_array.count = number_of_ratings
    # @average_rating = wheels_array.inject(:+) / number_of_ratings

    @family_options = ['Fresh', 'Soft Ripened', 'Washed Rind', 'Firm', 'Semi Soft', 'Hard', 'Blue']
  end

  # GET /cheeses/1/edit
  def edit
  end

  # POST /cheeses
  # POST /cheeses.json
  def create
    @cheese = Cheese.new(cheese_params)

    respond_to do |format|
      if @cheese.save
        format.html { redirect_to @cheese, notice: 'Cheese was successfully created.' }
        format.json { render :show, status: :created, location: @cheese }
      else
        format.html { render :new }
        format.json { render json: @cheese.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheeses/1
  # PATCH/PUT /cheeses/1.json
  def update
    respond_to do |format|
      if @cheese.update(cheese_params)
        format.html { redirect_to @cheese, notice: 'Cheese was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheese }
      else
        format.html { render :edit }
        format.json { render json: @cheese.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheese
      @cheese = Cheese.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheese_params
      params.require(:cheese).permit(:name, :image, :family, :style, :origin, :age, :milk, :farm_id)
    end
end
