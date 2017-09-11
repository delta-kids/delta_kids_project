class ProgramsController < ApplicationController

  # ONLY ADMIN
  def index
    @programs = Program.order(description: :asc).page(params[:page]).per(25)
  end

  def index0_5
    @age_group = "0-5"
    @programs = Program.all.joins(:age_groups).where(:age_groups => {:id => '1'})
    @artsandculture0_5 = @programs.where("program_type_id = '1'").order(description: :asc).page(params[:page]).per(8)
    @sports0_5 = @programs.where("program_type_id = '4'").order(description: :asc).page(params[:page]).per(8)
    @education0_5 = @programs.where("program_type_id = '6'").order(description: :asc).page(params[:page]).per(8)
    @parentandchild0_5 = @programs.where("program_type_id = '2'").order(description: :asc).page(params[:page]).per(8)
    @childandpreschool0_5 = @programs.where("program_type_id = '3'").order(description: :asc).page(params[:page]).per(8)
    @load_program = @programs.order(description: :asc).page(params[:page]).per(8)

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
    @age_group = "6-12"
    @programs = Program.all.joins(:age_groups).where(:age_groups => {:id => '2'})
    @artsandculture6_12 = @programs.where("program_type_id = '1'").order(description: :asc).page(params[:page]).per(8)
    @sports6_12 = @programs.where("program_type_id = '4'").order(description: :asc).page(params[:page]).per(8)
    @education6_12 = @programs.where("program_type_id = '6'").order(description: :asc).page(params[:page]).per(8)
    @parentandchild6_12 = @programs.where("program_type_id = '2'").order(description: :asc).page(params[:page]).per(8)
    @childandpreschool6_12 = @programs.where("program_type_id = '3'").order(description: :asc).page(params[:page]).per(8)
    @load_program = @programs.order(description: :asc).page(params[:page]).per(8)

    url = request.path_info
    if url.include?('6_12/arts_culture')
      @load_program = @artsandculture6_12
    elsif url.include?('6_12/sports')
      @load_program = @sports6_12
    elsif url.include?('6_12/education')
      @load_program = @education6_12
    elsif url.include?('6_12/parent_child')
      @load_program = @parentandchild6_12
    elsif url.include?('6_12/childcare')
      @load_program = @childandpreschool6_12
    end
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new program_params
    if @program.save
      flash[:notice] = 'Organization create'
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
  end
  private
  def program_params
    params.require(:program).permit([:description, :registration, :cost, { program_type_ids: [] }, { organization_id: [] }])
  end

  def find_program
    @program = Program.find params[:id]
  end

end
