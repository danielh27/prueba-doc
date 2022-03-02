class BranchEmployeesController < ApplicationController
  before_action :set_employee, only: %i[edit update]
  before_action :set_branches, only: %i[new create edit update]

  def new
    @employee = BranchEmployee.new
  end

  def create
    @employee = BranchEmployee.new(employee_params)

    if @employee.save
      redirect_to branches_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to edit_branch_path(@employee.branch)
    else
      render :edit
    end
  end

  private

  def set_branches
    @branches = Branch.where(user: current_user).map { |branch| [branch.name, branch.id] }
  end

  def set_employee
    @employee = BranchEmployee.find(params[:id])
  end

  def employee_params
    params.require(:branch_employee).permit(:name, :rfc, :role, :branch_id)
  end
end
