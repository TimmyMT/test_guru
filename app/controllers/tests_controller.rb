class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]
  before_action :find_user, only: [:start]

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_user
    @user = User.first
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end

end
