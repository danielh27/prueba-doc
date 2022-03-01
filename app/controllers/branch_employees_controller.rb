class BranchEmployeesController < ApplicationController
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

  private

  def employee_params
    params.require(:branch_employee).permit(:name, :rfc, :role, :branch_id)
  end
end
