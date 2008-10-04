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
      # controller�̃C���X�^���X�ϐ��ƁA���Ғl���r
      # ���ۂ̒l��ActionRecord�̃I�u�W�F�N�g�Ŋ��Ғl��Hush�Ȃ̂ŁAequal��r����Ɨ�����i�I�u�W�F�N�g�̎�ނ��Ⴄ����H�@id���Ȃ�����H�j
      assigns[:questionnarie][:title].should == "mytitle"
      assigns[:questionnarie][:description].should == "mydescription"
      assigns[:questionnarie][:limit].strftime("%Y%m%d").should == "20081231"
      assigns[:questionnarie][:publication].should == "public"
      assigns[:questionnarie][:note].should == "mynote"
      #,:description=>"description",:limit=>"20081231",:publication=>"public",:note=>"mynote"}})
      response.should redirect_to(:action => 'add_questions', :id => assigns[:questionnarie].id)
      #����Action���g�͉�ʑJ�ڂ����Ȃ��̂ŁAresponse.should  render_template()�͕s�v�B
    end
  end

end
