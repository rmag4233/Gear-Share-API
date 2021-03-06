class LoansController < OpenReadController
  before_action :set_loan, only: [:show, :update]
  before_action :set_delete_loan, only: [:destroy]

  # GET /loans
  def index
    @loans = Loan.all

    render json: @loans
  end

  # GET /loans/1
  def show
    render json: @loan
  end

  # POST /loans
  def create
    @loan = current_user.loans.build(loan_params)

    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /loans/1
  def update

    if @loan.owner.id == current_user.id
    @loan.update(loan_params)
      render json: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def set_delete_loan
      @loan = current_user.loans.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def loan_params
      params.require(:loan).permit(:borrower_id, :owner_id, :gear_id, :loan_start, :loan_end)
    end
end
