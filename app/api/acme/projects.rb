module Acme
  class Projects < Grape::API
    namespace :projects do
      desc 'Returns pong.'
      get do
        { ping: 'pong' }
      end

      desc 'Create a project.'
      params do
        requires :project, type: Hash do
          requires :name, type: String, desc: 'name'
          requires :status, type: String, desc: 'status'
          requires :created_at, type: String, desc: 'created_at'
          requires :client_id, type: String, desc: 'client_id'
        end
      end
      post { Project::Create.(params[:project]) }
      # post do
      #   # authenticate!
      #   # Project.create!({
      #   #   user: current_user,
      #   #   text: params[:status]
      #   # })
      #   { message: 'project created' }
      # end

      desc 'Update a project.'
      params do
        requires :id, type: String, desc: 'ID'
        optional :status, type: String, desc: 'status'
        optional :name, type: String, desc: 'status'
      end
      put ':id' do
        # authenticate!
        # current_user.statuses.find(params[:id]).update({
        #   user: current_user,
        #   text: params[:status]
        # })
        { message: 'project updated' }
      end

      desc 'Delete a project.'
      params do
        requires :id, type: String, desc: 'Status ID.'
      end
      delete ':id' do
        # authenticate!
        # current_user.statuses.find(params[:id]).destroy
        { message: 'project deleted' }
      end
    end
  end
end
