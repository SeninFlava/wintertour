class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    #:debug, :info, :warn, :error, :fatal и :unknown
    Rails.logger.info "**** Setting locale"
    
    if current_user.nil? || current_user.lang == "" 
      if request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first == "ru"
       I18n.locale = "ru"
      else
       I18n.locale = "en"
      end

       Rails.logger.info "**** Locale from browser=#{I18n.locale}"   
    else 
      if current_user.lang == "ru"
       I18n.locale = "ru"
      else
       I18n.locale = "en"
      end

       Rails.logger.info "**** Locale from User=#{I18n.locale}"   
    end
  end


  #поднять новость в списке
  def up_object(object, list)
    #one_news = News.find_by(id: params[:id])
    
    #отсортировали новости по row_num
    sorded_list = list.sort_by{ |elem| elem.row_num }.reverse
    
    #в отдельный массив взяли только новости у которых row_num больше чем у one_news
    upper_list = sorded_list.find_all{ |elem| elem.row_num > object.row_num }
    #отсортировали его
    upper_list.sort_by!{ |elem| elem.row_num }.reverse!

    #поменять row_num последнего элемента массива с row_num one_news
    if upper_list.count > 0
      row_num_b = upper_list.last.row_num
      upper_list.last.row_num = object.row_num
      object.row_num = row_num_b
      
      upper_list.last.save
      object.save
      true

      #redirect_to '/news', notice: "Новость #{one_news.title_en} поднята в списке"
    else
      false
      #redirect_to '/news', notice: "Новость #{one_news.title_en} первая в списке"    
    end

  end

  #опустить новость в списке
  def down_object(object, list)
    #one_news = News.find_by(id: params[:id])
    
    #отсортировали новости по row_num
    sorded_list = list.sort_by{ |elem| elem.row_num }.reverse
    
    #в отдельный массив взяли только новости у которых row_num меньше чем у one_news
    downer_list = sorded_list.find_all{ |elem| elem.row_num < object.row_num }
    #отсортировали его
    downer_list.sort_by!{ |elem| elem.row_num }.reverse!

    #поменять row_num последнего элемента массива с row_num one_news
    if downer_list.count > 0
      row_num_b = downer_list.first.row_num
      downer_list.first.row_num = object.row_num
      object.row_num = row_num_b
      
      downer_list.first.save
      object.save
      true
      #redirect_to '/news', notice: "Новость #{one_news.title_en} опущена в списке"
    else
      false
      #redirect_to '/news', notice: "Новость #{one_news.title_en} последняя в списке"    
    end
  end


  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :lang])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :lang])
  end

end
