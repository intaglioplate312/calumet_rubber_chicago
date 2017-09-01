class AboutController < ApplicationController

  def index
    @about_items = WebsiteItem.find(:all, :conditions => ["website_id = ? and website_item_type_id = 5", @my_website.id])
    @associates = @my_organization.associates.find(:all)
  end

end
