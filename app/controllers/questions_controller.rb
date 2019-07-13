class QuestionsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :authenticate_user!
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :find_test, only: [:new, :create]

  def index
    @questions = @test.questions
  end

  def show
    @answers = @question.answers
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  # Убрал чтобы видеть ошибки
  # def rescue_with_question_not_found
  #   render plain: 'Question was not found'
  # end

  def question_params
    params.require(:question).permit(:body)
  end
end
