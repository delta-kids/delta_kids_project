class WhatsNewItemsController < ApplicationController
  before_action :find_whats_new, only: [:show, :edit, :update, :destroy]


  def index
    @whats_new_items = WhatsNewItem.order(title: :asc).page(params[:page]).per(25)
  end

  def show
    @whats_new_item = WhatsNewItem.find(params[:id])
  end

  def learn_more
    @whats_new_item = WhatsNewItem.find(params[:id])
    @whats_new_items_random = WhatsNewItem.all.limit(3).order("RANDOM()")
  end

  def new
    @whats_new_item = WhatsNewItem.new
  end

  def create
      @whats_new_item = WhatsNewItem.new whats_new_params
      if @whats_new_item.image.present? == false
        @whats_new_item.image  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))
      end
      if @whats_new_item.save
        flash[:notice] = "What's New Item Created"
        redirect_to whats_new_item_path(@whats_new_item)
      else
        flash.now[:alert] = @whats_new_item.pretty_errors
        render :new
      end
  end

  def update
    if @whats_new_item.image.present? == false
      @whats_new_item.image  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))
    end
    @whats_new_item.update(whats_new_params)
    redirect_to @whats_new_item, notice: "Successfully Updated"
  end

  def destroy
    if is_admin?
      @whats_new_item.destroy
      redirect_to whats_new_items_path, notice: "What's New Item Deleted!"
    else
      flash[:alert] = "Access Denied"
      redirect_to @whats_new_item
    end
  end


  private
  def whats_new_params
    params.require(:whats_new_item).permit([:title, :description, :address, :email, :phone, :website_url, :image])
  end


  def find_whats_new
    @whats_new_item = WhatsNewItem.find params[:id]
  end
end
