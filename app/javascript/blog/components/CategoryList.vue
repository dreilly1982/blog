<template lang="pug">
  .categories(v-show="categories && categories.length")
    .box.mt-1: .level(v-for="category in categories")
      .level-left: .level-item
        p
          strong {{ category.name }}
          br
          | {{ category.description }}
      .level-right
        button.button.is-link(@click="editCategory(category)") Edit
        button.button.is-link(@click="deleteCategory(category)") Delete
</template>

<script>
export default {
  props: ['categories'],
  methods: {
    editCategory (category) {
      this.$emit('edit', category)
    },
    deleteCategory (category) {
      this.$emit('delete', category)
    }
  }
}
</script>
