class QuestionsController < ApplicationController
  before_action :check_login
  def index
    @questions=@event_session.questions.order('vote_count desc,id')
    @question=Question.new
    @left_panel_class='left-class'
    @right_panel_class='right-class'
    @center_panel_class='col-lg-12'
    @body_class="questions_index"
  end


  def refresh_questions
    @questions=@event_session.questions.order('vote_count desc,id')
    respond_to do |format|
        format.js
    end
  end

  def create
    redirect_to :root and return unless get_event_session
    question=Question.new(question_params)
    question.event_session=get_event_session
    responce=question.save
    flash[:success]= "Your Question has been asked successfully" if responce
    flash[:error]= "We could not save your questions" unless responce
    redirect_to questions_path
  end

  def vote_up
    question=@event_session.questions.where(:id=>params[:id]).first
    question.increment(:vote_count).save
    render :text => "Question Incremented";
  end

  private

  def question_params
    params.require(:question).permit(:description)
  end

  def check_login
    @event_session=get_event_session
    redirect_to :root ,:flash => {:error=>'Please login first by giving event access code'} unless @event_session
  end

end
