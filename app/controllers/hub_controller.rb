class HubController < ApplicationController
  before_action :get_site_info

  def index
  end

  def message
    @message = Message.find_by(code: params[:code])

    if (@message == nil && flash[:previous_message] != nil)
      @message = Message.find_by(code: flash[:previous_message])
    end

    if (@message == nil)
      flash[:error] = "That code doesn't work!"
      redirect_to root_path
    else
      flash[:previous_message] = @message.code
    end
  end

  def admin
    @messages = Message.all
  end

  def create_message
    new_message = Message.create(code: params[:code], message: params[:message], description: params[:description])
    redirect_to admin_path
  end

  def get_site_info
    if SiteInfo.all.length > 0
      @siteinfo = SiteInfo.first
    else
      @siteinfo = SiteInfo.create(title: "Hello Class!",
                                  enter_code_message: "Enter a Code",
                                  invalid_code_message: "That code doesn't work.",
                                  successful_code_message: nil)
    end
  end

  def update_site_info
    @siteinfo.update(site_info_params)
    redirect_to admin_path
  end

  def delete_message
    @message = Message.find(params[:id])
    @message.delete
    redirect_to admin_path
  end

  private

  def site_info_params
    params.require(:site_info).permit(:title, :enter_code_message, :invalid_code_message, :successful_code_message)
  end
end
