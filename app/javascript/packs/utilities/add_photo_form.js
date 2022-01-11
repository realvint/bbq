document.addEventListener('turbolinks:load', () => {
  const formLink = document.getElementById('event-photo-form-link')
  if(formLink) formLink.addEventListener('click', addPhotoForm)
})

const addPhotoForm = (event) => {
  event.preventDefault()
  const eventPhotoForm = document.getElementById('event-photo-form')

  setTimeout(() => {
    eventPhotoForm.classList.toggle('hide')
  }, 300)
}
