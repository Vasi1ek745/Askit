class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]

  def index
    @pagy, @questions = pagy(Question.order(created_at: :desc), items:6)
  end

  def show
    @answer = @question.answers.build
    @pagy, @answers = pagy(@question.answers.order(created_at: :desc), items: 5)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = 'Question update!'
      redirect_to questions_path(anchor: "question-#{@question.id}")
    else
      render :new
    end
  end

  def destroy
    if @question.delete
      flash[:success] = 'Question delete!'
      redirect_to questions_path
    else
      render :questions
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
