class BranchesController < ApplicationController
  before_action :set_branch, only: %i[edit update]

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

  def edit
    @employees = @branch.branch_employees
  end

  def update
    @employees = @branch.branch_employees
    if @branch.update(branch_params)
      redirect_to branches_path
    else
      render :edit
    end
  end

  private

  def set_branch
    @branch = Branch.find(params[:id])
  end

  def branch_params
    params.require(:branch).permit(:name, :street_name, :neighborhood_name, :indoor_number, :outdoor_number, :postal_code, :city, :country)
  end
end
