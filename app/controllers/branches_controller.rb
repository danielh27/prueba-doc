class BranchesController < ApplicationController
  def index
    @branches = Branch.where(user: current_user)
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.new(branch_params)
    @branch.user = current_user

    if @branch.save
      redirect_to branches_path
    else
      render :new
    end
  end

  private

  def branch_params
    params.require(:branch).permit(:name, :street_name, :neighborhood_name, :indoor_number, :outdoor_number, :postal_code, :city, :country)
  end
end
