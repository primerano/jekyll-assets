# ----------------------------------------------------------------------------
# Frozen-string-literal: true
# Copyright: 2012 - 2016 - MIT License
# Encoding: utf-8
# ----------------------------------------------------------------------------
require "rspec/helper"
describe Jekyll::Assets::Liquid::Filters do
  before :each do
    site.process
  end

  #

  let :site do
    stub_jekyll_site
  end

  #

  it "uses tags and returns the HTML" do
    expect(fragment(site.pages.first.to_s).xpath("p//img[contains(@alt, 'filter')]").size).to(
      eq 1
    )
  end

  let :env do
    Jekyll::Assets::Env.new(stub_jekyll_site("assets" => { "features" => { "liquid" => true }}))
  end

  it "has access to data files" do
    expect(env.find_asset("liquid_filter.js").to_s).to eq(
       "[{\"year\":\"2013\",\" value\":\" 23\"},{\"year\":\"2012\",\" value\":\" 29\"},{\"year\":\"2011\",\" value\":\" 28\"}]\n;\n"
    )
  end 
end
