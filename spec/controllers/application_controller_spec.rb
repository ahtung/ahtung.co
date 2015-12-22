require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render text: "Hello World"
    end
  end

  describe 'before_filters' do
    describe 'set_projects' do
      it "assigns @projects" do
        projects = create_list(:project, 2)
        get :index
        expect(assigns(:projects)).to match_array(projects)
      end
    end

    describe 'set_placeholders' do
      it "assigns @placeholders" do
        projects = create_list(:project, 2)
        get :index
        expect(assigns(:placeholders)).to eq(1)
      end

      it "sets 2 placeholders if 1 project" do
        projects = create_list(:project, 1)
        get :index
        expect(assigns(:placeholders)).to eq(2)
      end

      it "sets 1 placeholders if 2 projects" do
        projects = create_list(:project, 2)
        get :index
        expect(assigns(:placeholders)).to eq(1)
      end

      it "sets 0 placeholders if 3 projects" do
        projects = create_list(:project, 3)
        get :index
        expect(assigns(:placeholders)).to eq(0)
      end
    end
  end
end
