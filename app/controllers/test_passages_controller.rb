class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    gist = Gist.new(user_id: current_user.id, question_id: @test_passage.current_question.id, url: result.id)
    if gist.save && result.present?
      flash[:notice] = "#{view_context.link_to 'Go to gist', result.html_url} id: #{result.id}"
      redirect_to @test_passage
    else
      flash[:alert] = t('test_passages.gist_fail')
      redirect_to @test_passage
    end
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
