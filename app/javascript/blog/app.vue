<template lang="pug">
  #app
    vue-progress-bar

    nav.navbar.is-primary.is-sticky: .container
      .navbar-brand
        .navbar-item: img.avatar(src="/avatar.png" alt="Blog")
        .navbar-burger.burger(@click="isNavbarActive = !isNavbarActive" :class="isNavbarActive ? 'is-active' : ''")
          span
          span
          span

      .navbar-menu(
        :class="isNavbarActive ? 'is-active' : ''"
        @click="isNavbarActive = !isNavbarActive")
        .navbar-start
          router-link.navbar-item(to="/" exact) Newest posts
          template(v-if="categories.length" )
            router-link.navbar-item(v-for="category in categories"
              :to="`/categories/${category.slug}/posts`")
              |{{ category.name }}
        .navbar-end
          router-link.navbar-item(to="/settings" exact) Settings

    transition(name="slide-fade" mode="out-in")
      router-view(:key="$route.fullPath")
</template>

<script>
import { mapState } from 'vuex'

export default {
  data () {
    return {
      isNavbarActive: false
    }
  },

  created () {
    this.$Progress.start()

    this.$store.dispatch('fetchCategories').then(() => {
      this.$Progress.finish()
    })

    this.$router.beforeEach((to, from, next) => {
      if (to.meta.progress !== undefined) {
        let meta = to.meta.progress
        this.$Progress.parseMeta(meta)
      }
      this.$Progress.start()
      next()
    })

    this.$router.afterEach((to, from) => {
      this.$Progress.finish()
    })
  },

  computed: {
    ...mapState(['categories'])
  }
}
</script>
