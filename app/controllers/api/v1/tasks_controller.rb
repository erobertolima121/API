
module Api
	module V1
        class TasksController < ApplicationController
            # Listar todos os artigos
			def index
				tasks = Task.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Tarefas carregadas', data:tasks},status: :ok
            end
            # Listar artigo passando ID
			def show
				tasks = Task.find(params[:id])
				render json: {status: 'SUCCESS', message:'Tarefa carregada', data:tasks},status: :ok
            end
            # Criar um novo artigo
			def create
				tasks = Task.new(tasks_params)
				if tasks.save
					render json: {status: 'SUCCESS', message:'Tarefa inserida com sucesso', data:tasks},status: :ok
				else
					render json: {status: 'ERROR', message:'Tarefa não inserida com sucesso', data:tasks.erros},status: :unprocessable_entity
				end
            end
            # Excluir artigo
			def destroy
				tasksdelete = Task.find(params[:id])
				tasksdelete.destroy
				render json: {status: 'SUCCESS', message:'Tarefas excluída com sucesso', data:tasksdelete},status: :ok
            end
            # Atualizar um artigo
			def update
				tasksupdate = Task.find(params[:id])
				if tasksupdate.update_attributes(tasks_params)
					render json: {status: 'SUCCESS', message:'Tarefa atualizada com sucesso', data:tasksupdate},status: :ok
				else
					render json: {status: 'ERROR', message:'Articles not update', data:tasksupdate.erros},status: :unprocessable_entity
				end
			end
			# Parametros aceitos
			private
			def tasks_params
				params.permit(:title, :body)
            end
		end
	end
end