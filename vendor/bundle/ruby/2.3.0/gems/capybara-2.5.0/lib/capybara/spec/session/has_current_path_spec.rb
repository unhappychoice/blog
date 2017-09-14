Capybara::SpecHelper.spec '#has_current_path?' do
  before do
    @session.visit('/with_js')
  end

  it "should be true if the page has the given current path" do
    expect(@session).to have_current_path('/with_js')
  end

  it "should allow regexp matches" do
    expect(@session).to have_current_path(/w[a-z]{3}_js/)
    expect(@session).not_to have_current_path(/monkey/)
  end

  it "should wait for current_path", :requires => [:js] do
    @session.click_link("Change page")
    expect(@session).to have_current_path("/with_html")
  end

  it "should be false if the page has not the given current_path" do
    expect(@session).not_to have_current_path('/with_html')
  end

  it "should check query options" do
    @session.visit('/with_js?test=test')
    expect(@session).to have_current_path('/with_js?test=test')
  end

  it "should compare the full url" do
    expect(@session).to have_current_path(%r{\Ahttp://[^/]*/with_js\Z}, url: true)
  end

  it "should ignore the query" do
    @session.visit('/with_js?test=test')
    expect(@session).to have_current_path('/with_js?test=test')
    expect(@session).to have_current_path('/with_js', only_path: true)
  end

  it "should not allow url and only_path at the same time" do
    expect {
      expect(@session).to have_current_path('/with_js', url: true, only_path: true)
      }. to raise_error ArgumentError
  end
end

Capybara::SpecHelper.spec '#has_no_current_path?' do
  before do
    @session.visit('/with_js')
  end

  it "should be false if the page has the given current_path" do
    expect(@session).not_to have_no_current_path('/with_js')
  end

  it "should allow regexp matches" do
    expect(@session).not_to have_no_current_path(/w[a-z]{3}_js/)
    expect(@session).to have_no_current_path(/monkey/)
  end

  it "should wait for current_path to disappear", :requires => [:js] do
    @session.click_link("Change page")
    expect(@session).to have_no_current_path('/with_js')
  end

  it "should be true if the page has not the given current_path" do
    expect(@session).to have_no_current_path('/with_html')
  end
end
