module ApplicationHelper
  FLASH_NAME = {  success: 'alert-success', notice: 'alert-success',
                  error: 'alert-danger', alert: 'alert-danger' }.freeze

  def bootstrap_class_for_flash(flash_type)
    flash = FLASH_NAME[flash_type.to_sym] || flash_type.to_s
  end

  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_pack_path('media/images/event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_pack_path('media/images/event_thumb.jpg')
    end
  end

  def github_url(author, repo)
    link_to 'BBQ', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
