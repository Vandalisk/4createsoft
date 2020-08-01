module Acme
  class Projects < Grape::API
    namespace :projects do
      desc 'Returns projects'
      get do
        result = Project::Index.()

        if result.success?
          { message: 'projects' }
        else
          { message: result['contract.default'].errors.messages }
        end
      end

      desc 'Returns a project'
      params do
        requires :id, type: String, desc: 'ID'
      end
      get ':id' do
        result = Project::Show.(params: { id: params[:id]})

        if result.success?
          { message: 'show project' }
        else
          { message: result['contract.default'].errors.messages }
        end
      end

      desc 'Create a project.'
      params do
        requires :project, type: Hash do
          requires :name, type: String, desc: 'name'
          requires :status, type: String, desc: 'status'

          optional :client_id, type: String, desc: 'client_id'
          optional :client, type: Hash do
            requires :name, type: String
          end

          exactly_one_of :client_id, :client
        end
      end
      post do
        # authenticate!

        result = Project::Create.(params: params[:project])

        if result.success?
          { message: 'project created' }
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
        # authenticate!

        result = Project::Update.(params: { id: params[:id], project: params[:project] })

        if result.success?
          { message: 'project updated' }
        else
          { message: result['contract.default'].errors.messages }
        end
      end

      desc 'Delete a project.'
      params do
        requires :id, type: String, desc: 'Status ID.'
      end
      delete ':id' do
        # authenticate!

        result = Project::Delete.(params: { id: params[:id] })

        if result.success?
          { message: 'project deleted' }
        else
          { message: result['contract.default'].errors.messages }
        end
      end
    end
  end
end
