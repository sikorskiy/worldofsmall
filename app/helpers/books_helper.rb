module BooksHelper
  def user_review(user)
    user.reviews.new
  end

  def show_all_ratings(book)
    result_string = ""
    get_rating_types.each {|r| result_string+="<li><strong> #{r.rating_type} </strong><span class='avg-review-rating' data-score='#{book.average_special_rating(r.id)}'</span></li>"}
    result_string.html_safe
  end
end
