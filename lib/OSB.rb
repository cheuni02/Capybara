class OSBpage < VWBase

  def enter_postcode(arg)
    #<input id="pc" class="vw-input" type="text" placeholder="Enter postcode or location" value="" name="pc">
    @session.fill_in("Enter postcode or location", :with => arg)
  end

  def find_retailers
    #@session.click_button('vw-btn')
    @session.find(:xpath, '(//button[@class="vw-btn"])[1]').click
    @session.find(:css, '').click
  end
end