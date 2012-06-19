class DocumentsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :project
  load_and_authorize_resource :document, :through => :project
  respond_to :html, :js

  def index
    session[:ep_sessions] = {}
    respond_with @documents
  end

  def show
    ether = EtherpadLite.connect(:local, File.new('/home/hawk/Downloads/APIKEY.txt'))
    @group = ether.group(@project.group.id)
    @pad = @group.pad(@document.pad_id)
    author = ether.author("project_user_#{current_user.id}", :name => current_user)
    sess = session[:ep_sessions][@group.id] ? ether.get_session(session[:ep_sessions][@group.id]) : @group.create_session(author, 60)
    if sess.expired?
      sess.delete
      sess = @group.create_session(author, 60)
    end

    session[:ep_sessions][@group.id] = sess.id
    cookies[:sessionID] = { :value => sess.id, :host => "http://0.0.0.0:9001" }

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    respond_with @document
  end

  def edit
    respond_with @document
  end

  def create
    respond_to do |format|
      if @document.save!
        format.html { redirect_to project_documents_path(@project), notice: 'Document was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    ether = EtherpadLite.connect(:local, File.new('/home/hawk/Downloads/APIKEY.txt'))
    @group = ether.group(@project.group.id)
    @pad = @group.pad(@document.pad_id)
    @document.body = @pad.text
    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to project_documents_path(@project), notice: 'Document was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @document_id = @document.id
    @document.destroy

    respond_to do |format|
      format.html { redirect_to project_documents_path(@project) }
      format.js
    end
  end
end
