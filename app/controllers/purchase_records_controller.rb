class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_root_path

  def index
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new
  end

  def create
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new(purchase_record_params)
    if @purchase_record_delivery_address.valid?
      pay_item
      @purchase_record_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_delivery_address).permit(:postal_code, :pref_id, :city, :address, :building, :phone_num).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    redirect_to root_path if (current_user.id == @item.user_id) || PurchaseRecord.exists?(@item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
