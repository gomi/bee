class MakeFormsController < ApplicationController

  def new
    @questionnarie = Questionnarie.new(:publication => "private")
  end
  
  def create_questionnarie
    @questionnarie = Questionnarie.new(params[:questionnarie])

    if @questionnarie.save
      flash[:notice] = "登録を受け付けました"
      redirect_to :action => "add_questions", :id => @questionnarie.id
    else
      flash.now[:warning] = "登録に失敗しました。入力しなおしてください。"
      render :action => "new"
    end
  end

  def add_questions
   @questionnarie = Questionnarie.find(params[:id])
   @questions =[]
   3.times{ @questions << Question.new()}
  end

  def create_questions
    @questionnarie = Questionnarie.find(params[:questionnarie_id])
    params.each do |key, question_params|
      next unless key.to_s.include?('question_')
      @questionnarie.questions.create(question_params)
    end
    redirect_to :action => 'finish', :id => @questionnarie.id
 end
 
 def finish
     @answer_url = url_for(:controller => :answer_forms, :action => :new, :id=>params[:id])  
 end

  def edit
    @questionnarie = Questionnarie.find(:first, :conditions =>['id=?',params[:id]])
    unless @questionnarie
      flash[:warning] ='指定されたページは存在しません。'
      redirect_to :controller => :summary
    end
  end

  def update_questions
    @questionnarie = Questionnarie.find(params[:questionnarie_id])

    @questionnarie.attributes = params[:questionnarie]
    
    unless @questionnarie.save
     flash.now[:warning] = "登録に失敗しました。入力しなおしてください。"
      render :action => 'edit'
      return
    end
     flash[:notice] = "更新を受け付けました。"
     redirect_to :controller => 'summary', :action => 'show',:id => @questionnarie.id
  end

  def edit_question
    @question = Question.find(:first, :conditions =>['id = ?', params[:id]])
  end

  def update_question
    @question = Question.find(:first, :conditions =>['id = ?', params['question']['id']])
    @question.update_attributes(params[:question])
    flash[:notice] = "更新を受け付けました。"
    redirect_to :controller => 'summary', :action => 'show',:id => @question.questionnarie.id
  end
end
