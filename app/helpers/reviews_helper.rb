module ReviewsHelper

  def get_rating_types
    RatingType.all
  end

  def get_all_ratings
    rating_tags = ''
    get_rating_types.each { |r| rating_tags+="<div id = 'rating_form_#{r.id}'><label> #{r.rating_type} </label> </div>"}
    rating_tags.html_safe
  end

end
