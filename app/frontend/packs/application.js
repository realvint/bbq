// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/frontend and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
import 'stylesheets/application'
import '@fortawesome/fontawesome-free/css/all'
import './utilities/auto_hide_flash'
import './utilities/add_photo_form'
import './utilities/map'
import Lightbox from 'bs5-lightbox'

const images = require.context('../images', true)

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", () => {
  document.querySelectorAll('.lightbox').forEach((el) => el.addEventListener('click', (e) => {
    e.preventDefault()
    const lightbox = new Lightbox(el)
    lightbox.show()
  }))
})
