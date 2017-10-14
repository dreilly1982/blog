<template lang="pug">
  .category-page
    .section.py-0.my-1: .container: .level.is-mobile
      .level-left: .level-item
        breadcrumb(:items="breadcrumbItems")
      .level-right: .level-item
        router-link.button(append to="new") New post
    .section.py-0.my-1: .container
      h2.subtitle.is-5 {{ category.description }}
      post-list(:posts="posts" :is-loading="isLoading")
    .section.py-0.my-1: .container
      comments(:commentable="`categories/${id}`")

</template>

<script>
import { mapGetters } from 'vuex'
import api from '../api'
import PostList from '../pages/PostList'

export default {
  props: ['id'],

  data () {
    return {
      isLoading: true
    }
  },

  created (to, from, next) {
    setTimeout(() => {
      this.$store.dispatch('fetchPosts', this.id).then(() => {
        this.isLoading = false
      })
    }, 1337)
  },

  computed: {
    ...mapGetters(['posts', 'categories']),
    category () {
      return this.$store.getters.category(this.id)
    },
    breadcrumbItems () {
      return [{ text: this.category.name }]
    }
  },

  components: { 'post-list': PostList }
}
</script>
