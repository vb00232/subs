class HomeController < ApplicationController
  def home
  end

  def help
  end

  def contact
  end
  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    elsif name.blank?
      flash[:alert] = I18n.t('home.request_contact.no_name')
    else
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    redirect_to root_path
  end
end
