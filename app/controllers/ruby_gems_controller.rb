class RubyGemsController < ApplicationController
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
  end


  private

  def ruby_gem_params
    params.require(:ruby_gem).permit(:name, :author, :description, :github_url)
  end
end
