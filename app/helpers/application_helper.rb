module ApplicationHelper
  def user_avatar(user)
    asset_path('user.png')
  end

  def github_url(author, repo)
    link_to 'BBQ', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
