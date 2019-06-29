class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Test.find(params[:test_id]).questions
  end

  def show; end

  def new
    @test = Test.find(params[:test_id])
  end

  def create
    @question = Test.find(params[:test_id]).questions.new(question_params)
    if @question.save
      redirect_to test_question_path(params[:test_id], id: @question.id)
    else
      render plain: 'Aborted'
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(params[:test_id])
  end

  private

  def find_question
    # @questions = Test.find(params[:test_id]).questions
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
