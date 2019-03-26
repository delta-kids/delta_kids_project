class ProgramsController < ApplicationController
  before_action :find_program, only: [:show, :edit, :update, :destroy]

  # ONLY ADMIN
  def index
    @programs = Program.includes(:organization).order("organizations.name asc").page(params[:page]).per(25)
  end

  def index0_5
    @whats_new_items_random = WhatsNewItem.all.limit(3).order("RANDOM()")
    @age_group = "0-5"
    @programs = Program.includes(:organization).order("organizations.name asc").all.joins(:age_groups).where(:age_groups => { :id => '1' })
    @artsandculture0_5 = @programs.where("program_type_id = '1'").page(params[:page]).per(8)
    @sports0_5 = @programs.where("program_type_id = '4'").page(params[:page]).per(8)
    @education0_5 = @programs.where("program_type_id = '6'").page(params[:page]).per(8)
    @parentandchild0_5 = @programs.where("program_type_id = '2'").page(params[:page]).per(8)
    @childandpreschool0_5 = @programs.where("program_type_id = '3'").page(params[:page]).per(8)
    @load_program = Kaminari.paginate_array(@programs).page(params[:page]).per(8)

    url = request.path_info
    if url.include?('0_5/arts_culture')
      @load_program = @artsandculture0_5
    elsif url.include?('0_5/sports')
      @load_program = @sports0_5
    elsif url.include?('0_5/education')
      @load_program = @education0_5
    elsif url.include?('0_5/parent_child')
      @load_program = @parentandchild0_5
    elsif url.include?('0_5/childcare')
      @load_program = @childandpreschool0_5
    end
  end

  def index6_12
    @whats_new_items_random = WhatsNewItem.all.limit(3).order("RANDOM()")
    @age_group = "6-12"
    @programs = Program.includes(:organization).order("organizations.name asc").all.joins(:age_groups).where(:age_groups => { :id => '2' })
    @artsandculture6_12 = @programs.where("program_type_id = '1'").page(params[:page]).per(8)
    @sports6_12 = @programs.where("program_type_id = '4'").page(params[:page]).per(8)
    @education6_12 = @programs.where("program_type_id = '6'").page(params[:page]).per(8)
    @communityclubs = @programs.where("program_type_id = '5'").page(params[:page]).per(8)
    @school_break_camps = @programs.where("program_type_id = '7'").page(params[:page]).per(8)
    @load_program = Kaminari.paginate_array(@programs).page(params[:page]).per(8)

    url = request.path_info
    if url.include?('6_12/arts_culture')
      @load_program = @artsandculture6_12
    elsif url.include?('6_12/sports')
      @load_program = @sports6_12
    elsif url.include?('6_12/education')
      @load_program = @education6_12
    elsif url.include?('6_12/community_clubs')
      @load_program = @communityclubs
    elsif url.include?('6_12/school_break_camps')
      @load_program = @school_break_camps
    end
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new program_params
    if @program.save
      flash[:notice] = 'Program Created'
      redirect_to program_path(@program)
    else
      flash.now[:alert] = @program.pretty_errors
      render :new
    end
  end

  def show
    @program = Program.find(params[:id])
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program.update(program_params)
    redirect_to @program, notice: "Successfully Updated"
  end

  def destroy
    if is_admin?
      @program.destroy
      redirect_to programs_path, notice: "Program Deleted!"
    else
      flash[:alert] = "Access Denied"
      redirect_to @program
    end
  end

  def learn_more
    @program = Program.find(params[:id])
    @similar_programs = Program.where(program_type_id: @program.program_type_id).limit(3).order("RANDOM()")
  end

  helper_method :construct_url

  def construct_url(url)
    url.include? "https" ? protocol = "https://" : protocol = "http://"
    constructed_url ="#{protocol + url.sub(/^https?\:\/\//, '').sub(/^www./, '')}"
    return constructed_url
  end

  private

  def program_params
    params.require(:program).permit([:program_description, :registration, :cost, :program_type_id, :age_group_id, :organization_id, :image, { age_group_ids: [] }])
  end

  def find_program
    @program = Program.find params[:id]
  end
end
