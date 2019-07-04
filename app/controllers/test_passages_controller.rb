class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :update, :result]

  attr_accessor :completed_test

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to test_passage_result_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
