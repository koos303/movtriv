class QuestionsController < ApplicationController
  def play
    begin
      QuestionGenerator.update if Question.count == 0
      @question = Question.random
      build_options
    rescue
      render :no_questions
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

  def build_options
    @options = [@question.answer]
    @options.concat(@question.others)
  end
end
