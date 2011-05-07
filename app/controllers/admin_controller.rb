class AdminController < CmsapplicationController
  def index
  end

  def manage
    @user=current_user
    @usern=User.new
  end

  def create
    user=User.new(params[:user])
    if user.save
      str="User " + user.email + " added"
      redirect_to(manage_path, :notice=>str)
    else
      redirect_to(manage_path, :notice=>"Adding user failed.")
    end
    
  end

  def changepass
    user=params[:user]
    @current=User.find(current_user.id)
    change={:password=>user["password"],:password_confirmation=>user["password_confirmation"]}
    if(change[:password]!=change[:password_confirmation])
      redirect_to(manage_path, :notice=>'Passwords do not match')
    elsif @current.update_attributes(:password=>user['password'],:password_confirmation=>user['password_confirmation'])
      redirect_to(new_user_session_path, :notice=>'Password successfully changed')
    else
      redirect_to(manage_path, :notice=>'Password change failed.')
    end
  end
end
