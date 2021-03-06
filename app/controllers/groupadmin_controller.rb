class GroupadminController < ApplicationController
  
  # 그룹 가입 신청
  def membership_join
    
    membership = Membership.new
    membership.group_id = params[:group_id]
    membership.group_name = params[:group_name]
    membership.user_id = current_user.id
    membership.apply_nickname = current_user.nickname
    membership.apply_introduce = params[:apply_introduce]
    membership.save
    
    redirect_to :back
  end
  
  # 그룹 관리 페이지
  def group_admin
    @group = Group.find(params[:id])
    # group_id에 따라서 membership list를 출력한다
    @membership = Membership.where(:group_id => params[:id])
  end
  
  # 가입 승인
  def membership_accept
    #get방식으로 membership id가 넘어오면 해당 accepted_on이 nil이여서 승인 안된 회원을 현재시간부터 회원으로 승인
    accept = Membership.find(params[:id])
    accept.accepted_on = DateTime.now
    accept.save
    redirect_to :back
  end
  
  def group_modify
    group = Group.find(params[:id])
    if (current_user.valid_password?(params[:password]))
    group.group_name = params[:group_name]
    group.group_max = params[:group_max]
    group.group_region = params[:group_region]
    group.group_interest = params[:group_interest]
    group.group_content = params[:group_content]
    group.save
    end
    redirect_to :back
  end
  
  def group_destroy
    group = Group.find(params[:id])
    if (current_user.valid_password?(params[:password]))
    group.destroy
    end
    redirect_to '/'
  end
  
end
