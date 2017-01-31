module RedmineExAgileHelper
  def find_member_from_all_users(id)
    member = @all_users.find { |m| m.principal.id == id.to_i }
    if member
      member.name
    else
      "[No Name]"
    end
  end
end
