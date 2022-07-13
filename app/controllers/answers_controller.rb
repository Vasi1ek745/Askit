class AnswersController < ApplicationController
  before_action :find_question 
  before_action :find_answer, only: %i[edit update destroy]

  def create    
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def edit
       
  end

  def update      
    if @answer.update(answer_params)
      flash[:success] = 'Answer edit!'
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    
   
    if @answer.delete
      flash[:success] = 'Answer delete!'
      redirect_to question_path(@question)
    else
      render :edit
    end

  end
  private
    def answer_params
      params.require(:answer).permit(:body)
    end
    def find_question
      @question = Question.find(params[:question_id])
    end
    def find_answer
      @answer = @question.answers.find params[:id]
    end
end
