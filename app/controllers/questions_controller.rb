class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Test.find(params[:test_id]).questions
  end

  def show; end

  def new
    @test = Test.find(params[:test_id])
  end

  def create
    @question = @test.questions.new(params.require(:question).permit(:body))
    if @question.save
      render plain: 'Created'
      redirect_to test_question_path
    else
      render plain: 'Aborted'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_question
    @questions = Test.find(params[:test_id]).questions
    @question = @questions.find(params[:id])
  end

  # def find_test
  #   @test = Test.find(params[:test_id])
  # end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
