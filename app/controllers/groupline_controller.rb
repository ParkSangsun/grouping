class GrouplineController < ApplicationController
  def group_create
    
    groupline = Group.new
    groupline.group_name = params[:group_name]
    groupline.group_founder = params[:group_founder]
    groupline.group_max = params[:group_max]
    groupline.group_region = params[:group_region]
    groupline.group_interest = params[:group_interest]
    groupline.group_content = params[:group_content]
    groupline.group_like = 0
    groupline.save
    redirect_to '/'
  end

  def group_list
    @groupline = Group.all
  end

  def group_detail
    @detail = Group.find(params[:id])
    @reply = Reply.all
    @groupline = Group.all
  end
  
  def group_like
    group = Group.find(params[:id])
    group.group_like = group.group_like + 1
    group.save
    redirect_to :back
  end
  
  def reply_write
    
    group_reply = Reply.new
    group_reply.group_id = params[:group_id]
    group_reply.reply_username = "작성자"
    group_reply.reply_content = params[:content]
    group_reply.save
    redirect_to :back
  end
end
