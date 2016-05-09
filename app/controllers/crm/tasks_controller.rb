module CRM
  class TasksController < CRM::ApplicationController

    # GET /accounts
    #----------------------------------------------------------------------------
    def index
      render :show
      #render concept("crm/task/index_cell", @tasks)
      #CRM::Task::IndexCell.asdf(@task).()
    end

    # POST /tasks
    #----------------------------------------------------------------------------
    def create
      run CRM::Task::Create do |op|
        flash[:notice] = "Task successfully created"
        return redirect_to crm_task_path(op.model)
      end
      flash[:alert] = "Oops, something went wrong"
      render action: :new
    end

    def confirm
      run CRM::Task::Confirm do |op|
        flash[:notice] = "Task set to completed"
        return redirect_to crm_task_path
      end
      flash[:alert] = "Oops, something went wrong"
      render action: :show
    end

    def destroy
      run CRM::Task::Delete do |op|
        return redirect_to crm_task_path
      end
      render :show
    end

    def edit

    end


  end
end


