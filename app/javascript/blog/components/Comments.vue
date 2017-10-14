<template lang="pug">
  .comments(style="margin-top: 2rem;")
    h1.subtitle.is-5 Comments
    form(@submit.prevent="onSubmit"): .input-group
      b-field()
        p.control.is-expanded
          b-input(v-model="comment.content" placeholder="Write your comment" type="text")
        p.control
          button.button Send
      br/
    transition-group(name="slide-fade" appear mode="out-in" tag="div")
      .media(v-for="comment in items" v-bind:key="comment.id")
        .media-left
          figure.image.is-48x48
            img.avatar(:src="getAvatar(comment.author)" alt="Avatar")
        .media-content
          .content
            p
              b {{ comment.author }}
              br/
              | {{ comment.content }}
</template>

<script>
import api from '../api'

export default {
  props: ['commentable'],

  data () {
    return {
      comment: {
        author: '',
        content: ''
      },
      items: []
    }
  },
  methods: {
    getAvatar (author) {
      return '/avatars/' + author.split(' ')[1].toLowerCase() + '.jpg'
    },
    onSubmit () {
      this.comment.author = this.getRandomAuthor()
      api.createComment(this.commentable, this.comment).then((response) => {
        this.items.unshift(response.data)
        this.comment.content = ''
      })
    },
    getRandomAuthor () {
      const authors = [
        'Albert Einstein',
        'Charles Darwin',
        'Nicolaus Copernicus',
        'Johannes Kepler',
        'Werner Heisenberg',
        'Rober Boyle'
      ]
      return authors[Math.floor(Math.random() * authors.length)]
    }
  },
  created () {
    api.fetchComments(this.commentable).then((response) => {
      this.items = response.data
    })
  }
}
</script>
