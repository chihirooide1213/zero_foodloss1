class InquiriesController < ApplicationController
  def new
  	@inquiry = Inquiry.new
  end

  def create
  	@cinquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiriesController.inquiry_mail(@inquiry).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:mail, :message, :name)
  end
end
