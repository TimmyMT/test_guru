class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all.where(test_id: params[:test_id])
  end

  def show

  end

  def new
    @question = Question.new
  end

  def create
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  def destroy
    @question.destroy
  end

  private

  def find_question
    @questions = Test.find(params[:test_id]).questions
    @question = @questions.find_by(id: params[:id])
    unless @questions.include?(@questions.find_by(id: params[:id]))
      rescue_with_question_not_found
    end
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
