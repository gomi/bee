class SummaryController < ApplicationController

  def index
    @questionnarie = Questionnarie.find(:all,:order=>'id ASC')
  end

#TODO 以下は動作確認未了
  def show
    #TODO 指定されたレコードがない場合に備えた精査を入れる
    @questionnarie = Questionnarie.find(params[:id])
  end

end
