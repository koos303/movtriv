class QuestionsController < ApplicationController
  def play
    @question = random_question
    build_options
  end

  def check
    @question = Question.find(params[:question_id])

    if params[:answer].to_i == @question.answer.id
      flash[:right] = "Hurray!"
      redirect_to :action => "play"
    else
      flash[:wrong] = "Awwwh :'( </3"
      build_options
      render :play
    end
  end

  private

  def random_question
    offset = rand(Question.count)
    rand_record = Question.first(:offset => offset)
  end

  def build_options
    @options = [@question.answer] 
    @options.concat(@question.others)
  end
end
