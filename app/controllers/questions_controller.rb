class QuestionsController < ApplicationController
  def play
    if Question.count == 0
      render :no_questions
    else
      @question = random_question
      build_options
    end
  end

  def check
    @question = Question.find(params[:question_id])

    if params[:answer].to_i == @question.answer.id
      flash[:notice] = "Hurray!"
      redirect_to :action => "play"
    else
      flash[:alert] = "Awwwh :'( </3"
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
