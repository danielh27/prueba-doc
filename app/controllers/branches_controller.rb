class BranchesController < ApplicationController
  def index
    @branches = Branch.where(user: current_user)
  end
end
