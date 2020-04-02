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

    # Checks if details are valid
    valid = false

    if !(name.match(/[a-zA-Z]/))
      flash[:alert] = I18n.t('home.request_contact.no_name')
    elsif !(email.match(/[a-zA-Z][a-zA-Z_0-9\\.]*@[a-zA-Z_0-9]+[\\.]+[a-zA-Z]/))
      flash[:alert] = I18n.t('home.request_contact.no_email')
    elsif telephone.size != 11
      flash[:alert] = I18n.t('home.request_contact.no_telephone')
    elsif message.blank?
      flash[:alert] = I18n.t('home.request_contact.no_message')
    else
      flash[:notice] = I18n.t('home.request_contact.email_sent')
      valid = true
    end
    # Redirects to the home page if email sent
    if valid
      redirect_to root_path

    # Redirects back to contact page if email not sent
    else
      redirect_to contact_path

    end
  end
end
