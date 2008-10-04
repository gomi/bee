require File.dirname(__FILE__) + '/../spec_helper'

describe MakeFormsController do
  describe "new" do
    before do
      get :new
    end

    it 'success' do
      response.should be_success
      response.should  render_template('make_forms/new')
      assigns[:questionnarie].should_not be_nil
    end
  end

  describe "create_questionnarie" do
    before do
      get :create_questionnarie, {:questionnarie => {:title=>"mytitle",:description=>"mydescription",:limit=>"20081231",:publication=>"public",:note=>"mynote"}}
    end

    it 'success' do
      # controllerのインスタンス変数と、期待値を比較
      # 実際の値はActionRecordのオブジェクトで期待値はHushなので、equal比較すると落ちる（オブジェクトの種類が違うから？　idがないから？）
      assigns[:questionnarie][:title].should == "mytitle"
      assigns[:questionnarie][:description].should == "mydescription"
      assigns[:questionnarie][:limit].strftime("%Y%m%d").should == "20081231"
      assigns[:questionnarie][:publication].should == "public"
      assigns[:questionnarie][:note].should == "mynote"
      #,:description=>"description",:limit=>"20081231",:publication=>"public",:note=>"mynote"}})
      response.should redirect_to(:action => 'add_questions', :id => assigns[:questionnarie].id)
      #このAction自身は画面遷移をしないので、response.should  render_template()は不要。
    end
  end

end
