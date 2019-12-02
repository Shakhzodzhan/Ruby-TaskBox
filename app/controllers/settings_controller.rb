class SettingsController < ApplicationController
  def index
    # @tags = Tag.order('tag.title ASC').all
    # @categories = Category.order('category.title ASC').all
    @categories = current_user.categories.all.order("title")

    @tags = current_user.tags.all.order("title")
  end
end

