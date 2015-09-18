class GrouplineController < ApplicationController
  def group_create
    
    groupline = Group.new
    groupline.group_name = params[:group_name]
    groupline.group_founder = current_user.nickname
    groupline.group_max = params[:group_max]
    groupline.group_region = params[:group_region]
    groupline.group_interest = params[:group_interest]
    groupline.group_content = params[:group_content]
    groupline.group_like = 0
    groupline.save
    
    membership = Membership.new
    membership.group_id = groupline.id
    membership.group_name = groupline.group_name
    membership.user_id = current_user.id
    membership.apply_nickname = current_user.nickname
    membership.accepted_on = DateTime.now
    membership.save
    
    redirect_to '/'
  end

  def group_list
    @groupline = Group.all
  end

  def group_detail
    @detail = Group.find(params[:id])
    @reply = Reply.all
    #@userid = current_user.nickname
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
    group_reply.post_id = params[:post_id]
    group_reply.reply_username = current_user.nickname
    group_reply.reply_content = params[:content]
    group_reply.save
    redirect_to :back
  end
  
  def group_sns
    @group = Group.find(params[:id])
    @group_post = Post.all
  end
  
  def post_create
    
    create_post = Post.new
    create_post.group_id = params[:group_id]
    create_post.post_username = current_user.nickname
    create_post.post_content = params[:post_content]
    create_post.post_like = 0
    create_post.save
    
    redirect_to :back
  end
  
  def post_like
    post = Post.find(params[:id])
    post.post_like = post.post_like + 1
    post.save
    redirect_to :back
  end
  
  def friend_list
    @user = User.all
    @group = Group.all
  end
end
