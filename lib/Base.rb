class VWBase < BrowserContainer

  def osb_page
     OSBpage.new(@session)
  end


end