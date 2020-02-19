module ApplicationHelper

  # Returns the full title on a per-page basis.
 def full_title(page_title = '')
   base_title = "Medio"
   if page_title.empty?
     base_title
   else
     page_title + " | " + base_title
   end
 end

 def fullname(current_user)
   if current_user.middle_initial.empty?
      return current_user.first_name + " " + current_user.last_name
   else
     return current_user.first_name + " " + current_user.middle_initial + " " + current_user.last_name
   end
 end

 def gender(current_user)
    if current_user.gender == "M"
        return "Male"
    elsif current_user.gender == "F"
        return "Female"
    else
        return "Other"
    end
  end

  def fullAddress(current_user)
    return current_user.city + ", " + current_user.state + ", " + current_user.zipcode
  end

end
