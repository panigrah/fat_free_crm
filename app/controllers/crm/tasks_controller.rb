module CRM
  class TasksController < CRM::ApplicationController

    # GET /accounts
    #----------------------------------------------------------------------------
    def show
      #render concept("crm/task/index_cell", @tasks)
      CRM::Task::IndexCell.asdf(@task).()
    end

    # POST /tasks
    #----------------------------------------------------------------------------
    def create
      run Task::Create do |op|
        flash[:notice] = "Task successfully created"
        return redirect_to task_path(op.model)
      end
      flash[:alert] = "Oops, something went wrong"
      render action: :new
    end

  end
end


