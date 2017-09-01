class NewsController < ApplicationController

  def index
    @news_items = WebsiteItem.find(:all, 
                                   :conditions => ["website_id = ? and website_item_type_id = 1 and current_date between start_date and end_date", @my_website.id],
                                   :order => "start_date DESC")
    if @news_items.nil? or @news_items.empty?
      @news_items = [WebsiteItem.new(:title => "No News", :description => "No news is good news.")]
    end
  end

end
