# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
	
	before_action :login_required, :only => [:edit_link, :new, :create, :edit,:update,:destroy]
	
	def index
		@pages = Page.recent
	end

	def news
		@pages = Page.where( :page_tag => 'news', ).recent
		render :action => :index
	end

	def practical
		@pages = Page.where( :page_tag => 'practical', ).recent
		render :action => :index
	end

	def front_end
		@pages = Page.where( :page_tag => 'front_end', ).recent
		render :action => :index
	end

	def recommend
		@pages = Page.where( :page_tag => 'recommend', ).recent
		render :action => :index
	end

	def other
		@pages = Page.where( :page_tag => 'other', ).recent
		
	end

	def hot
		@pages = Page.hot
		render :action => :index
	end



	def new
		@page = Page.new
	end

	def show
		@page = Page.find(params[:id])

		@page.hit
	end

	def edit
		@page = current_user.pages.find(params[:id])
	end

	def create
		@page = current_user.pages.build(page_params)

		if @page.save
			redirect_to pages_path
		else
			render :new
		end
	end

	def update
		@page = current_user.pages.find(params[:id])

		if @page.update(page_params)
			redirect_to page_path(@page)
		else
			render :edit
		end
	end

	def destroy
		@page = current_user.pages.find(params[:id])

		@page.destroy

		redirect_to pages_path
	end



	#其他分頁

	def edit_link
		@page = current_user.pages.find(params[:id])
	end





	def feed
    @pages = Page.all(:select => "id, title, description, content, intro, created_at").recent.limit(20)
    render :template => 'pages/feed.rss.builder', :layout => false
  end

	def home
		@must_hot_page = Page.hot.first
		@good_front = Page.find(7)
		@good_back = Page.find(2)
		@new_pages = Page.recent.limit(5)
	end


	private

	def page_params
		params.require(:page).permit(:content, :intro, :messenge, :page_tag, :title, :thumbnail_url, :description)
	end

end
