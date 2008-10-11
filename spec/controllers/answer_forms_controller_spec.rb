require File.dirname(__FILE__) + '/../spec_helper'

describe AnswerFormsController do

  describe "finish" do
    before do
      get :finish
    end

    it 'success' do
      response.should be_success
      response.should  render_template('answer_forms/finish')
    end
  end

end
