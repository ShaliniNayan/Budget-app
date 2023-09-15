class BillsController < ApplicationController
  before_action :set_bill, only: %i[show edit update destroy]

  def index
    @bills = current_user.bills.all
  end

  def show
    @bill = current_user.bills.find(params[:id])
  end

  def new
    @bill = Bill.new
    @group_id = params[:group_id]
  end

  def edit; end

  def create
    @bill = current_user.bills.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to group_path(@bill.group_id), notice: 'Bill was successfully created.' }
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
        format.html { redirect_to group_path(@bill.group_id), notice: 'Bill was successfully updated.' }
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
      format.html { redirect_to group_url(params[:group_id]), notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:name, :amount, :group_id, :description)
  end
end
