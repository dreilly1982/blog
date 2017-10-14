<template lang="pug">
  .home-page
    .section.py-0.my-1: .container
      breadcrumb(:items="breadcrumbItems")
    .section.py-0.my-1: .container
      post-list(:posts="posts" :is-loading="isLoading")
    template(v-if="!categories.length")
      .section.py-0.my-1: .container
        p Create categories in <router-link to="/settings">settings</router-link>.
</template>

<script>
import { mapGetters } from 'vuex'
import PostList from '../pages/PostList'

export default {
  data () {
    return {
      breadcrumbItems: [
        {
          text: 'Newest'
        }
      ],
      isLoading: true
    }
  },

  created (to, from, next) {
    setTimeout(() => {
      this.$store.dispatch('fetchPosts').then(() => {
        this.isLoading = false
      })
    }, 500)
  },

  computed: {
    ...mapGetters(['posts', 'categories'])
  },

  components: {
    'post-list': PostList
  }
}
</script>
