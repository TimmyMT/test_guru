class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.html_url.present?
      Gist.create!(user_id: current_user.id,
                   question_id: @test_passage.current_question.id,
                   url: result.html_url, gist_hash: result.id)
      flash[:notice] = "#{t('test_passages.gist.success')}
        #{helpers.link_to result.id, result.html_url}"
    else
      flash[:alert] = t('test_passages.gist.failure')
    end
    redirect_to @test_passage
  end

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      BadgeControlService.new(@test_passage).call
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
