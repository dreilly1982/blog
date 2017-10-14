<template lang="pug">
  .columns.is-multiline
    .column.is-4(v-for="i in [1, 2, 3]" v-show="isLoading")
      .card
        .card-image
          figure.image.is-2by1.animated-background(style="background-color: #eee;")
        .card-content
          .media
            .media-left
              figure.image.is-48x48: .avatar.animated-background(style="background-color: #eee; width: 100%; height: 100%;")
            .media-content
              p.title.is-5.animated-background(style="background-color: #eee; display: block; margin-bottom: 0; height: 1em;")
              p.subtitle.is-7.animated-background(style="background-color: #eee; display: inline-block; margin-top: .8em; height: 1em; width: 7em;")

    template(v-if="!isLoading && posts.length > 0")
      .column(v-for="post in posts" v-bind:key="post.id" :class="posts.length > 3 ? 'is-4' : ''")
        .card
          .card-image
            router-link(:to="`/categories/${post.category_slug}/posts/${post.slug}`")
              figure.image.is-2by1
                img(:src="`/placeholders/post-${post.id % 17}.jpg`")
          .card-content
            .media
              .media-left
                figure.image.is-48x48
                  img.avatar(src="/avatar.png")
              .media-content
                p.title.is-5 {{ post.name }}
                p.subtitle.is-7 {{ post.category_name }}
</template>

<script>
export default {
  props: ['posts', 'isLoading']
}
</script>
