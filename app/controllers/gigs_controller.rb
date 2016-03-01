class GigsController < ApplicationController
  def index
    @gigs = Gig.all.order("created_at DESC")
    @gigs = Gig.paginate(page: params[:page], per_page: 5)
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.save
    redirect_to @gig
  end

  def search
    @gigs = Gig.search(params).order("created_at DESC").paginate(page: params[:page], per_page: 25)
  end  

  def show
    @gig = Gig.find(params[:id])
  end

  private
   def gig_params
     params.require(:gig).permit(:name, :description, :budget, :location, :open)
   end
end
