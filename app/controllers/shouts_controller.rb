class ShoutsController < ApplicationController
  def create
    current_user.shouts.create(shouts_params)
    redirect_to dashboard_path
  end
  private

  def shouts_params
    params.require(:shout).permit(:content).merge(user: current_user)
  end
end
