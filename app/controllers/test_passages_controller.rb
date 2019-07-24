class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    Gist.create(user_email: current_user.email, question_id: @test_passage.current_question.id, gist_url: result.html_url)
    flash[:notice] = result.html_url

    redirect_to @test_passage
  end

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
