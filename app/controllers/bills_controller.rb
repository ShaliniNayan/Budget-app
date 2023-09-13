class BillsController < ApplicationController
  before_action :set_bill, only: %i[show edit update destroy]

  def index
    @bills = Bill.all
  end

  def show; end

  def new
    @bill = Bill.new
    @group_id = params[:group_id]
  end

  def edit; end

  def create
    @bill = current_user.bills.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to group_bill_url(@bill.group_id, @bill), notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to group_bill_url(@bill.group_id, @bill), notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:name, :amount, :group_id)
  end
end