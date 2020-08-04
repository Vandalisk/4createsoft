module Acme
  class Projects < Grape::API
    namespace :projects do
      desc 'Returns projects'
      get do
        result = Project::Index.(request: request)
        if result.success?
          ::ProjectSerializer.new(result['model']).serializable_hash
        else
          { message: result['contract.default'].errors.messages }
        end
      end

      desc 'Returns a project'
      params do
        requires :id, type: String, desc: 'ID'
      end
      get ':id' do
        result = Project::Show.(request: request, params: { id: params[:id]})

        if result.success?
          ::ProjectSerializer.new(result['model']).serializable_hash
        else
          { message: result['contract.default'].errors.messages }
        end
      end

      desc 'Create a project.'
      params do
        requires :project, type: Hash do
          requires :name, type: String, desc: 'name'
          requires :status, type: String, desc: 'status'

          requires :client, type: Hash do
            requires :name, type: String
          end
        end
      end
      post do
        result = Project::Create.(request: request, params: params[:project])

        if result.success?
          ::ProjectSerializer.new(result['model']).serializable_hash
        else
          { message: result['contract.default'].errors.messages }
        end
      end

      desc 'Update a project.'
      params do
        requires :id, type: String, desc: 'ID'
        requires :project, type: Hash do
          optional :status, type: String, desc: 'status'
          optional :name, type: String, desc: 'status'
        end
      end
      put ':id' do
        result = Project::Update.(request: request, params: { id: params[:id], project: params[:project] })

        if result.success?
          ::ProjectSerializer.new(result['model']).serializable_hash
        else
          { message: result['contract.default'].errors.messages }
        end
      end

      desc 'Delete a project.'
      params do
        requires :id, type: String, desc: 'Status ID.'
      end
      delete ':id' do
        result = Project::Delete.(request: request, params: { id: params[:id] })

        if result.success?
          ::ProjectSerializer.new(result['model']).serializable_hash
        else
          { message: result['contract.default'].errors.messages }
        end
      end
    end
  end
end
