class GigsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :search, :show]
  def index
    @gigs = Gig.all.order_list(params[:sort_by]).paginate(page: params[:page], per_page: 25)
    @users = User.all
  end

  def new
    @gig = Gig.new
  end

  def create
    #@gig = current_user.gigs.create(gig_params)
    @gig = Gig.new(gig_params)
    @gig.user = current_user
    if @gig.save
      redirect_to @gig
    else
      flash[:error] = @gig.errors.full_messages.to_sentence
      render :new
    end
  end

  def search
    if params[:category].blank? && params[:search].blank?
      @gigs = Gig.all.order(created_at: :desc).paginate(page: params[:page], per_page: 25)
    else
      @gigs = Gig.search(params).order("created_at DESC").paginate(page: params[:page], per_page: 25)
    end
      @users = User.all
  end

  def edit
    @gig = Gig.find(params[:id])
    if current_user != @gig.user
      flash[:error] = "You are not the owner!"
      redirect_to @gig
    end  
  end

  def update
    @gig = Gig.find(params[:id])
    if current_user == @gig.user
      @gig.update(gig_params)
      redirect_to @gig
    else
      flash[:error] = "You are not the owner!"
    end
    redirect_to @gig
  end

  def destroy
    @gig= Gig.find(params[:id])
    if current_user == @gig.user
      @gig.destroy
      redirect_to :mygigs
    else
      flash[:error] = "You are not the owner!"
    end
    redirect_to :mygigs
  end

  def show
    @gig = Gig.find(params[:id])
    @proposals = @gig.proposals.order(created_at: :desc)
    @awarded_proposal = Proposal.where(id: @gig.awarded_proposal).first
  end

  def mygigs
    @gigs = Gig.where(user_id: current_user).order(created_at: :asc)
  end

  private
   def gig_params
     params.require(:gig).permit(:name, :description, :budget, :location, :open, :category_id, :skill_list, :awarded_proposal)
   end
end
