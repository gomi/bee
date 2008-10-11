class AnswerFormsController < ApplicationController
  def new
    @questionnarie = Questionnarie.find(params[:id])
    @answer_profile = AnswerProfile.new(:questionnarie_id => @questionnarie.id)
  end
  def create
    @answer_profile = AnswerProfile.new(params[:answer_profile])
    if @answer_profile.save
      params.each do |key, answer_item_params|
        next unless key.to_s.include?('answer_item')
        @answer_profile.answer_items.create(answer_item_params)
      end
    else
      flash.now[:warning] = "登録に失敗しました。入力しなおしてください。"
      render :action => "new"
    end
     redirect_to :action => :finish
  end

  def finish

  end

end
