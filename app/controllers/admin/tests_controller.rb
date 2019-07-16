class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
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
    @test.creator_id = current_user.id
    if @test.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
