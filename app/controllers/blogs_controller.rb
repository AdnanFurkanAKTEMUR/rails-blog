class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]

    
    def index
        @blogs = Blog.all
    end

    def show
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new

        if @blog.save
            redirect_to blogs_path, notice: "Blog başarılı bir şekilde oluşturuldu!"
        else
            render :new
        end
    end

    def edit

    end

    def Update
        if @blog.update(blog_params)
            redirect_to blogs_path, notice: "Blog başarılı bir şekilde güncellendi!"
          else
            render :edit
          end
    end

    def destroy
        @blog.destroy
        redirect_to blog_path, notice: "Blog başarılı bir şekilde silindi!"
    end

    private 

    def set_blog
        @blog = Blog.find(params[:id])
    end

    def blog_params
        params.require(:blog).permit(:name)
    end
end
