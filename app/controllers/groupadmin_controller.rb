class GroupadminController < ApplicationController
  
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
  
  def group_admin
    #@membership = Membership.find(params[:id])
    @membership = Membership.where(:group_id => params[:id])
    #@group = Group.find(params[:id])
  end
  
  def membership_accept
    accept = Membership.find(params[:id])
    accept.accepted_on = DateTime.now
    accept.save
    redirect_to :back
  end
  
end
