class QuestsController < BaseController
  before_action :set_quest, only: [:finish, :cancel]

  def index
    @quests = Quest.where("requestor = :id or executor = :id", id: current_user.id)
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.requestor = current_user.id

    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { render :new }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    @quest.finished!
  end

  def cancel
    @quest.cancelled!
  end

  private
    def set_quest
      @quest = Quest.find(params[:id])
    end

    def quest_params
      params.require(:quest).permit(:executor, :description)
    end
end
