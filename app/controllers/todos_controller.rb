class TodosController < ApplicationController
    before_action :set_todo, only:[:show, :edit, :destroy, :update]
    def index
        @todos = Todo.all
    end
    def new
        @todo = Todo.new
    end

    def show
       
    end

    def edit
       
    end

    def create
        @todo = Todo.create(todo_params)
        
        if @todo.save
            redirect_to todo_path(@todo)
            flash[:notice] = "Todo was created successfully"
        else
            redirect_to  new_todo_path
            flash[:error] = @todo.errors.full_messages
        end  
    end

    def update        
        if @todo.update(todo_params)
            flash[:notice] = "Todo was updated successfully"
            redirect_to todo_path(@todo)
        else
            redirect_to edit_todo_path(@todo)
            flash[:error] = @todo.errors.full_messages
        end
    end

    def destroy        
        @todo.destroy
        flash[:notice] = "Todo has been successfully deleted"
        redirect_to todos_path
    end


    private
        def set_todo
            @todo = Todo.find(params[:id])
        end
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end