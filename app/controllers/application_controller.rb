# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  before_filter :init_organization
# Disable access from Google Web Accelerator 
  before_filter :disable_link_prefetching

# Sessions on/off
#  session :off

private

  def disable_link_prefetching
    if request.env["HTTP_X_MOZ"] == "prefetch" 
      logger.debug "prefetch detected: sending 403 Forbidden" 
      render_nothing "403 Forbidden" 
      return false
    end
  end

  def init_organization

    # Get organization and website information via url lookup
    @my_hostname = 'calumetrubber.com'
    
    if @my_hostname.nil?
      logger.fatal "No host name available"
      render_nothing "403 Forbidden" 
      return false
    end
    
#   Strip 'www.' from hostname if it is there
    if @my_hostname[1..4] == "www."
      @my_hostname = @my_hostname[5..-1]
    end
    
#   Handle port at end of website name if it is there
    colon_location = @my_hostname.index(':')
    if !colon_location.nil?
      @my_hostname = @my_hostname[0..(colon_location - 1)]
    end
    
#   Get Website and Organization Information
    @my_website = Website.find(:first, :conditions => ["url = ?", @my_hostname] , :include => :organization)

#   Handle not found and other errors
    if @my_website.nil?
      logger.fatal "Hostname " + @my_hostname + " not found"
      render_nothing "403 Forbidden" 
      return false
    else
      if @my_website.organization.nil?
        logger.fatal "Organization not found for host" + @my_hostname
        render_nothing "403 Forbidden" 
        return false
      else
        @my_organization = @my_website.organization
      end
    end
  end

end
