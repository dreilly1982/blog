<template lang="pug">
  nav.breadcrumb
    ul
      li: router-link(exact to='/') Blog
      router-link(v-for="item in items" tag="li" :to="item.to || $route.path" exact)
        a {{ item.text }}
</template>

<script>
export default {
  props: ['items']
}
</script>
