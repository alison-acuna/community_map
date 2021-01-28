class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
    @tags = Tag.all
  end

  def create
    @person = Person.new(person_params)
    params[:person][:tag_ids].each do |tag_id|
      unless tag_id.empty?
        @tag = Tag.find(tag_id)
        @person.person_tags.build(person: @person, tag: @tag)
      end
    end
    if @person.save!
      redirect_to @person
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
    @tags = Tag.all
  end

  def update
    @person = Person.find(params[:id])
    @tags = @person.tags.find(:all)

    if @person.update(person_params)
      redirect_to @person
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to root_path
  end

  def person_params
    params.require(:person).permit(:id, :name, :pronouns, {:tag_ids => []})
  end
end
