<template lang="pug">
  .post-page
    .section.py-0.my-1: .container: .level.is-mobile
      .level-left: .level-item
        breadcrumb(:items="breadcrumbItems")
      .level-right: .level-item
        router-link.button.is-link(:to="`/categories/${post.category_slug}/posts/${post.slug}/edit`") Edit post

    section.hero.is-small
      .hero-body: .container
        h1.title {{ post.name }}
        h2.subtitle {{ post.category_name }}

    .section.py-0.my-1(style="min-height: 10vh;"): .container
      .content(v-html="renderedContent")
    .section: .container
      comments(:commentable="`posts/${id}`")
</template>

<script>
import api from '../api'
import marked from 'marked'

export default {
  props: ['id'],

  data () {
    return {
      post: {}
    }
  },

  created () {
    api.fetchPost(this.id).then((response) => {
      this.post = response.data
    })
  },

  computed: {
    breadcrumbItems () {
      return [
        {
          text: this.post.category_name,
          to: `/categories/${this.post.category_slug}/posts`
        },
        {
          text: this.post.name
        }
      ]
    },
    renderedContent () {
      return marked(this.post.content || '')
    }
  }
}
</script>
