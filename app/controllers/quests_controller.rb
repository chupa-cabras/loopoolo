class QuestsController < BaseController
  before_action :set_quest, only: [:finish, :cancel]

  def index
    load_quests
    @quest = Quest.new
    #binding.pry
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.requestor = current_user.id
    @quest.status = :open


    respond_to do |format|
      if @quest.save
        load_quests
        format.html { render :index, notice: 'Quest was successfully created.' }
        format.json { render :index, status: :created, location: @quest }
      else
        load_quests
        format.html { render :index }
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

    def load_quests
      @quests = Quest.where("requestor = :id or executor = :id", id: current_user.id)
    end

    def quest_params
      params.require(:quest).permit(:executor, :description)
    end
end
