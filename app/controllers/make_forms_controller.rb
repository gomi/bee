class MakeFormsController < ApplicationController

  before_filter :validate_questionnarie_exist,
                :only => [ :add_questions,:edit,:finish,:create_questions,:update_questionnarie ]
  before_filter :validate_question_exist,
                :only => [ :edit_question,:update_question ]

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
    #TODO by kyuumin questionsレコードが既にあっても、URL直接指定でここにくると、questionsが空で表示される

    @questions =[]
    3.times{ @questions << Question.new()}
  end

  def create_questions
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
  end

  def update_questionnarie
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
  end

  def update_question
    @question.update_attributes(params[:question])
    flash[:notice] = "更新を受け付けました。"
    redirect_to :controller => 'summary', :action => 'show',:id => @question.questionnarie.id
  end

  def validate_questionnarie_exist
    @questionnarie = Questionnarie.find_by_id(params[:id] || params[:questionnarie_id])
    unless @questionnarie
      flash[:warning] ='指定されたページは存在しません。'
      redirect_to :controller => :summary
      return false
    end
  end

  def validate_question_exist
    @question = Question.find_by_id(params[:id] || params['question']['id'])
    unless @question
      flash[:warning] ='指定されたページは存在しません。'
      redirect_to :controller => :summary
      return false
    end
  end

end
