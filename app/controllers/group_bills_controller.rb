class GroupBillsController < ApplicationController
  before_action :set_group_bill, only: %i[show edit update destroy]

  def index
    @group_bills = GroupBill.all
  end

  def show; end

  def new
    @group_bill = GroupBill.new
  end

  def edit; end

  def create
    @group_bill = GroupBill.new(group_bill_params)

    respond_to do |format|
      if @group_bill.save
        format.html { redirect_to group_bill_url(@group_bill), notice: 'group bill was successfully created.' }
        format.json { render :show, status: :created, location: @group_bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group_bill.update(group_bill_params)
        format.html { redirect_to group_bill_url(@group_bill), notice: 'group bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group_bill.destroy

    respond_to do |format|
      format.html { redirect_to group_bills_url, notice: 'group bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_group_bill
    @group_bill = GroupBill.find(params[:id])
  end

  def group_bill_params
    params.require(:group_bill).permit(:group_id, :bill_id)
  end
end
