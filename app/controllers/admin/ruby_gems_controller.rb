module Admin
  class RubyGemsController < ApplicationController
    def destroy
      @ruby_gem = RubyGem.find(params[:id])
      @ruby_gem.delete
      redirect_to ruby_gems_path
    end
  end
end
