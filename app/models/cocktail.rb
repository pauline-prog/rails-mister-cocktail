class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, { through: :doses, source: 'ingredient' }
  validates :name, presence: true, uniqueness: true

  def index
  	@cocktails = Cocktail.all
  end

  def show
  	@cocktail = Cocktail.find(params[:id])
  end

  def new
  	@cocktail = Cocktail.new
  end

  def create
  	@coktail = Cocktail.new(cocktail_params)
  	if @cocktail.save
  	  redirect_to cocktail_path(@cocktail)
  	else
  	  render :new
  	end
  end

  private

  def coktail_params
  	params.require(:cocktail).permit(:name)
  end
end
