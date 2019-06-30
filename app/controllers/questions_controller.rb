class QuestionsController < ApplicationController
  before_action :find_test, only: [:new, :create, :index, :show, :edit, :update]
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_question_path(@test, @question)
    else
      render plain: 'Aborted'
    end
  end

  def update
    if @question = @test.questions.update(question_params)
      redirect_to test_question_path(@test, @question)
    else
      render plain: 'Aborted'
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
