class QuestsController < BaseController
  before_action :set_quest, only: [:finish, :cancel]

  def index
    @my_quests = Quest.where("executor_id = :id", id: current_user.id)
    @requested_quests = Quest.where("requestor_id = :id", id: current_user.id)
    @quest = Quest.new
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.requestor = current_user
    @quest.status = :open


    respond_to do |format|
      if @quest.save
        format.html { render :index, notice: 'Quest was successfully created.' }
        format.json { render :index, status: :created, location: @quest }
      else
        format.html { render :index }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    @quest.finished!
    render :index, notice: 'Quest was finished.'
  end

  def cancel
    @quest.cancelled!
    render :index, notice: 'Quest was cancelled.'
  end

  private
    def set_quest
      @quest = Quest.find(params[:id])
    end

    def quest_params
      params.require(:quest).permit(:executor_id, :description)
    end
end
