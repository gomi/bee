# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/make_forms/new" do
  describe "new questionnarie" do
    before do
      render '/make_forms/new'
    end

    it "initial display" do
      response.should have_tag("table#questionnarie") do
        with_tag("input#questionnarie_title", "")
        with_tag("textarea#questionnarie_description", "")
        with_tag("input#questionnarie_limit", "")
        with_tag("input#questionnarie_publication_private", "")
        with_tag("input#questionnarie_publication_public", "")        
        with_tag("textarea#questionnarie_note", "")
      end
    end
  end

end
