# Blog

Example of Rails 5 /w webpacker + Vue app.

[Demo](http://nameless-lake-68867.herokuapp.com/) - Hosted on Heroku. On the first hit it gets loaded and stays loaded until some time passes without anyone accessing it.

## Overview

Basic Blog with categories, posts, comments

* **Frontend**
  * **Javascript**
    * [Vue.js](https://vuejs.org/)
      * [vuex](https://vuex.vuejs.org/en/intro.html), [vue-router](https://router.vuejs.org/en/)
    * [axios](https://github.com/axios/axios) - Promise based HTTP client for the browser and node.js
    * [Buefy](https://buefy.github.io/) - Lightweight UI components for Vue.js based on Bulma
    * [vee-validate](https://github.com/baianat/vee-validate) - vee-validate is a plugin for Vue.js that allows you to validate input fields, and display errors.

  * **Styling**
    * [Bulma](http://bulma.io/) - Bulma is a free and open source CSS framework based on Flexbox.
* **Backend**
  * Rails 5 w/ [webpacker](https://github.com/rails/webpacker)
    * `turbolinks` - removed

## Models

...

## Deployment

...

## Todo

* Tests
* File uploading for post covers
* User management
* WebSockets
