class CheesesController < ApplicationController
  helper CheesesHelper
  before_action :set_cheese, only: [:show, :edit, :update, :destroy]

  def index
    @cheeses = Cheese.all.sort_by { |cheese| cheese.average_rating }.reverse
    @farms = Farm.all
  end

  def show
    authenticate_user!
    @reviews = Review.where(cheese_id: params[:id])
    @review = Review.new
    @wheel_scale = [1, 2, 3, 4, 5]
    @family_options = ['Fresh', 'Soft Ripened', 'Washed Rind', 'Firm', 'Semi Soft', 'Hard', 'Blue']

  end

  def what_is
    @user = current_user
  end

  # this will eventually be a page that just show one of the seven families of cheese
  # def show_family
  #   @cheeses = Cheese.where(cheese.family: params[:id])
  # end

  def new
    authenticate_user!
    @cheese = Cheese.new
    set_cheese_options
  end

  def edit
  end

  def create
    @cheese = Cheese.new(cheese_params)
    respond_to do |format|
      if @cheese.save
        format.html { redirect_to @cheese, notice: 'Cheese was successfully created.' }
        format.json { render :show, status: :created, location: @cheese }
      else
        set_cheese_options
        format.html { render :new }
        format.json { render json: @cheese.errors, status: :unprocessable_entity }
      end
    end
  end


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

    def set_cheese_options
      farm_options = Farm.all
      @farm_names = []
      farm_options.each do |farm|
        @farm_names << [farm.name, farm.id]
      end
      @milk_options = ['Cow', 'Sheep', 'Goat']
      @family_options = ['Fresh', 'Soft Ripened', 'Washed Rind', 'Firm', 'Semi Soft', 'Hard', 'Blue']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheese_params
      params.require(:cheese).permit(:name, :image, :family, :style, :origin, :age, :milk, :farm_id)
    end
end
