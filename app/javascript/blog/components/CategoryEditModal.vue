<template lang="pug">
  form(@submit.prevent="submitForm")
    .modal-card
      header.modal-card-head
        p.modal-card-title Category
      section.modal-card-body
        b-field(
          label="Name"
          :type="errors.has('name') ? 'is-danger' : ''"
          :message="errors.has('name') ? 'Must be at least 2 words and 2 letters, first word with<br/>capital letter and period at the end.' : ''")

          b-input(
            type="text"
            name="name"
            v-model="category.name"
            v-validate="{ required: true, regex: /^[A-Z]\\w{1,}.*\\s+\\w{2,}[.]$/ }"
            placeholder="Name")

        b-field(label="Description")
          b-input(type="text" v-model="category.description" placeholder="Description")

      footer.modal-card-foot
        button.button(type="button" @click="$parent.close()") Close
        button.button.is-primary(:disabled="errors.any()") {{ category.id ? 'Save' : 'Create' }}
</template>

<script>
import Vue from 'vue'

export default {
  props: ['initialCategory'],
  data () {
    return {
      category: Vue.util.extend({}, this.initialCategory)
    }
  },

  methods: {
    submitForm () {
      this.$validator.validateAll().then((isValid) => {
        if (isValid) {
          this.saveCategory()
        }
      })
    },
    saveCategory () {
      this.$emit('submit', this.category)
    }
  }
}
</script>
