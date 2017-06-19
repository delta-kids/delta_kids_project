class ProgramsController < ApplicationController

  # ONLY ADMIN

    def index
        link = params[:id]
        if link === "0_5"
            @age_group = "0-5"
            @programs = Program.where(id: ProgramAgeGroup.where(age_group: AgeGroup.find_by(age:'0-5')))
        elsif link === "0_5_arts_culture"
            @age_group = "0-5"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Arts & Culture'))
        elsif link === "0_5_sports"
            @age_group = "0-5"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Sports'))
        elsif link === "0_5_education"
            @age_group = "0-5"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Education'))
        elsif link === "0_5_parent_child"
            @age_group = "0-5"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Parent & Child'))
        elsif link === "0_5_childcare"
            @age_group = "0-5"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Childcare & Preschools'))
        elsif link === "6_12"
            @age_group = "6-12"
            @programs = Program.where(id: ProgramAgeGroup.where(age_group: AgeGroup.find_by(age:'6-12')))
        elsif link === "6_12_arts_culture"
            @age_group = "6-12"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Arts & Culture'))
        elsif link === "6_12_sports"
            @age_group = "6-12"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Sports'))
        elsif link === "6_12_education"
            @age_group = "6-12"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Education'))
        elsif link === "6_12_community"
            @age_group = "6-12"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Community Clubs'))
        elsif link === "6_12_childcare"
            @age_group = "6-12"
            @programs = Program.where(program_type: ProgramType.find_by(name: 'Child Care'))
        end
    end

    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def learn_more
    end


end
