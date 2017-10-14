<template lang="pug">
  .post-edit-page: form(@submit.prevent="submitForm")

    .section.py-0.my-1: .container: .level.is-mobile
      .level-left: .level-item
        breadcrumb(:items="breadcrumbItems")
      .level-right: .level-item
        .field.is-grouped
          p.control: button.button.is-primary(:disabled="errors.any()" type="submit") {{ post.id ? 'Update' : 'Create' }}
          p.control(v-if="post.id"): button.button(@click.prevent="confirmDelete") Delete
          p.control: button.button.is-link(@click.prevent="$router.go(-1)") Back

    .section.py-0.my-1: .container: .columns
      .column
        b-field(
          label="Name"
          :type="errors.has('name') ? 'is-danger' : ''"
          :message="errors.has('name') ? 'Must be at least 2 words and 2 letters, first word with capital letter and period at the end.' : ''")

          b-input(
            type="text"
            name="name"
            v-model="post.name"
            v-validate="{ required: true, regex: /^[A-Z]\\w{1,}(.*)\\s+\\w{2,}(.*)[.]$/ }"
            placeholder="Name")

        b-field(label="Content")
          textarea.textarea(v-model="post.content" rows="8")

      .column
        h2.title.is-4 Preview
        .preview.content(v-html="previewContent")
</template>

<script>
import api from '../api'
import { mapGetters } from 'vuex'
import marked from 'marked'

export default {
  props: ['categoryId', 'id'],
  data () {
    return {
      post: { name: '', content: '' }
    }
  },
  methods: {
    confirmDelete () {
      this.$dialog.confirm({
        title: 'Deleting post',
        message: 'Are you sure you want to <b>delete</b> this post? This action cannot be undone.',
        confirmText: 'Delete Post',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: () => {
          api.deletePost(this.id).then(() => {
            this.$router.push(`/categories/${this.category.slug}/posts`)
            this.$toast.open('Post deleted')
          })
        }
      })
    },
    submitForm () {
      this.post.category_slug = this.category.slug
      api.savePost(this.post).then((response) => {
        this.$router.push(`/categories/${this.category.slug}/posts/${response.data.slug}`)
        this.$toast.open({ message: 'Post saved', type: 'is-success' })
      })
    }
  },
  created () {
    if (this.id) {
      api.fetchPost(this.id).then((response) => {
        this.post = response.data
      })
    }
  },
  computed: {
    ...mapGetters(['categories']),

    previewContent () {
      return marked(this.post.content)
    },

    category () {
      return this.$store.getters.category(this.categoryId)
    },

    breadcrumbItems () {
      return [
        {
          text: this.category.name,
          to: `/categories/${this.category.slug}/posts`
        },
        {
          text: this.post.name
        }
      ]
    }
  }
}
</script>
