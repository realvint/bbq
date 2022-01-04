module ApplicationHelper
  FLASH_NAME = {  success: 'alert-success', notice: 'alert-success',
                  error: 'alert-danger', alert: 'alert-danger' }.freeze

  def bootstrap_class_for_flash(flash_type)
    flash = FLASH_NAME[flash_type.to_sym] || flash_type.to_s
  end

  def user_avatar(user)
    asset_path('user.png')
  end

  def github_url(author, repo)
    link_to 'BBQ', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
