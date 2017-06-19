class ServicesController < ApplicationController

  # ONLY ADMIN

  def index
    @services = Service.all
  end

  def pregnancy_babies
    link = params[:id]
    if params === "help"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Help in a Crisis'), category: Category.find_by(name: 'Pregnancy & Babies'))
    elsif params === "baby"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Health & Development'), category: Category.find_by(name: 'Pregnancy & Babies'))
    elsif params === "support"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Supports for families'), category: Category.find_by(name: 'Pregnancy & Babies'))
    end
  end

  def children
    link = params[:id]
    if params === "help"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Help in a Crisis'), category: Category.find_by(name: 'Pregnancy & Babies'))
    elsif params === "baby"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Health & Development'), category: Category.find_by(name: 'Pregnancy & Babies'))
    elsif params === "support"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Supports for families'), category: Category.find_by(name: 'Pregnancy & Babies'))
    end
  end

  def families
    link = params[:id]
    if params === "help"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Help in a Crisis'), category: Category.find_by(name: 'Families'))
    elsif params === "childcare"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Childcare & Preschool'), category: Category.find_by(name: 'Families'))
    elsif params === "assistance"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Assistance with fees'), category: Category.find_by(name: 'Families'))
    elsif params === "support"
      @services = Service.where(service_type: ServiceType.find_by(name: 'Supports for families'), category: Category.find_by(name: 'Families'))
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
