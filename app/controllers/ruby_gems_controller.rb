class RubyGemsController < ApplicationController

  def index
    @ruby_gems = RubyGem.all
    @ruby_gems = RubyGem.order("name").page(params[:page])
  end

  def new
    @ruby_gem = RubyGem.new
  end

  def create
    @ruby_gem = RubyGem.new(ruby_gem_params)

    if @ruby_gem.save
      redirect_to @ruby_gem, notice: "Successfully added gem"
    else
      render 'new', notice: "Gem not created"
    end
  end

  def show
    @ruby_gem = RubyGem.find(params[:id])
    @reviews = Review.where(ruby_gem_id: @ruby_gem.id).page(params[:page])
  end


  private

  def ruby_gem_params
    params.require(:ruby_gem).permit(:name, :author, :description, :github_url)
  end
end
