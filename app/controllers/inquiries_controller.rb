class InquiriesController < ApplicationController
  def new
  	@inquiry = Inquiry.new
  end

  def create
  	@inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to inquiries_thanks_path
    else
      render :new
    end
  end

  def thenks
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:mail, :message, :name)
  end
end
