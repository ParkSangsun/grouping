class GrouplineController < ApplicationController
  def group_create
    # 그룹 생성
    groupline = Group.new
    groupline.group_name = params[:group_name]
    groupline.group_founder = current_user.nickname
    groupline.group_max = params[:group_max]
    groupline.group_region = params[:group_region]
    groupline.group_interest = params[:group_interest]
    groupline.group_content = params[:group_content]
    groupline.save
    
    # 그룹 생성과 동시에 founder도 Membership에 등록한다
    membership = Membership.new
    membership.group_id = groupline.id
    membership.group_name = groupline.group_name
    membership.user_id = current_user.id
    membership.apply_nickname = current_user.nickname
    # founder는 자동으로 가입 신청 승인됨
    membership.accepted_on = DateTime.now
    membership.save
    
    redirect_to '/'
  end
  
  # 전체 그룹 리스트 페이지
  def group_list
    @groupline = Group.all
  end
  
  # 그룹 상세 페이지
  def group_detail
    @detail = Group.find(params[:id])
    @reply = Reply.all
    @exist = Like.where(:user_id => current_user.id)
  end
  
  # 그룹 자체 좋아요
  def like
      @likes = Like.where(:group_id => params[:group_id], :user_id => current_user.id)
      
      if @likes.exists?
        @likes.destroy_all
        redirect_to :back
      else
        like = Like.new
        like.user_id = current_user.id
        like.group_id = params[:group_id]
        like.post_id = params[:post_id]
        like.reply_id = params[:reply_id]
        like.save
        redirect_to :back
      end
      
      
  end
  
  # 리플 달기
  def reply_write
    group_reply = Reply.new
    group_reply.group_id = params[:group_id]
    group_reply.post_id = params[:post_id]
    group_reply.reply_username = current_user.nickname
    group_reply.reply_content = params[:content]
    group_reply.save
    redirect_to :back
  end
  
  #그룹 SNS
  def group_sns
    @group = Group.find(params[:id])
    @group_post = Post.all
  end
  
  # SNS 글작성
  def post_create
    
    create_post = Post.new
    create_post.group_id = params[:group_id]
    create_post.post_username = current_user.nickname
    create_post.post_content = params[:post_content]
    create_post.save
    
    redirect_to :back
  end
  
  # SNS 글 좋아요
  def post_like
    post = Post.find(params[:id])
    post.post_like = post.post_like + 1
    post.save
    redirect_to :back
  end
  
  # 사용자 List
  def friend_list
    @user = User.all
    @group = Group.all
  end
  
  #프로필 이미지 업로드
  def profile_update
  @users = User.find(params[:id])
  @users.profile_img = params[:profile_img]
  @users.save
  
  redirect_to '/'
  end
  
  def profile
    @profile = User.find(params[:id])
  end
  
  def post_delete
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to :back
  end
  
  def post_modify
    post = Post.find(params[:id])
    post.post_content = params[:post_content]
    post.save
    
    redirect_to :back
  end
end
