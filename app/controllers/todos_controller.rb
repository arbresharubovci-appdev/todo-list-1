class TodosController < ApplicationController
  def index
    matching_todos = Todo.all

    @list_of_todos = matching_todos.order({ :created_at => :desc })

    render({ :template => "todos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_todos = Todo.where({ :id => the_id })

    @the_todo = matching_todos.at(0)

    render({ :template => "todos/show.html.erb" })
  end

  def create
    the_todo = Todo.new
    the_todo.next_up = params.fetch("query_next_up")
    the_todo.in_progress = params.fetch("query_in_progress")
    the_todo.done = params.fetch("query_done")

    if the_todo.valid?
      the_todo.save
      redirect_to("/todos", { :notice => "Todo created successfully." })
    else
      redirect_to("/todos", { :alert => the_todo.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_todo = Todo.where({ :id => the_id }).at(0)

    the_todo.next_up = params.fetch("query_next_up")
    the_todo.in_progress = params.fetch("query_in_progress")
    the_todo.done = params.fetch("query_done")

    if the_todo.valid?
      the_todo.save
      redirect_to("/todos/#{the_todo.id}", { :notice => "Todo updated successfully."} )
    else
      redirect_to("/todos/#{the_todo.id}", { :alert => the_todo.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_todo = Todo.where({ :id => the_id }).at(0)

    the_todo.destroy

    redirect_to("/todos", { :notice => "Todo deleted successfully."} )
  end
end
