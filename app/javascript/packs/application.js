// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

const { default: axios } = require('axios')
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common[ 'X-CSRF-Token' ] = csrfToken()

$(function() {
  $('.slick').slick({
      dots: true,
  });
}); 

document.addEventListener('DOMContentLoaded', () => {
  $('.post-card').each(function(){
    console.log($(this).data('post-id'));
    const postId = $(this).data('post-id');
      const handleHeartDisplay = (hasLiked) => {
        if (hasLiked) {
          $(`#${postId}.active-heart`).removeClass('hidden')
        } else {
          $(`#${postId}.inactive-heart`).removeClass('hidden')
        }
      }

      axios.get(`/api/posts/${postId}/like`)
        .then((response) => {
          const hasLiked = response.data.hasLiked
          handleHeartDisplay(hasLiked)
        })
  });

    $('.inactive-heart').on('click', (e) => {
      e.preventDefault();
      const postId = $(e.currentTarget).attr('id');
      console.log(postId);
      axios.post(`/api/posts/${postId}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $(`#${postId}.active-heart`).removeClass('hidden')
            $(`#${postId}.inactive-heart`).addClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })

    $('.active-heart').on('click', (e) => {
      e.preventDefault();
      const postId = $(e.currentTarget).attr('id');
      console.log(postId);
      axios.delete(`/api/posts/${postId}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $(`#${postId}.active-heart`).addClass('hidden')
            $(`#${postId}.inactive-heart`).removeClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })
})