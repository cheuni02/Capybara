class BrowserContainer
  def initialize(session)
    @session = session
  end

  def visit_page(path = '')
    @session.visit(URLS + path)
  end
end