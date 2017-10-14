import axios from 'axios'

export default {
  fetchCategories () {
    return axios.get('/api/categories')
  },
  saveCategory (category) {
    return category && category.id ? this.updateCategory(category) : this.createCategory(category)
  },
  deleteCategory (categoryId) {
    return axios.delete(`/api/categories/${categoryId}`)
  },
  updateCategory (category) {
    return axios.put(`/api/categories/${category.slug}`, { category: category })
  },
  createCategory (category) {
    return axios.post('/api/categories', { category: category })
  },

  createComment (commentable, comment) {
    return axios.post(`/api/${commentable}/comments`, { comment: comment })
  },
  fetchComments (commentable) {
    return axios.get(`/api/${commentable}/comments`)
  },

  fetchPosts (category) {
    return axios.get(category ? `/api/categories/${category}/posts` : `/api/posts`)
  },
  fetchPost (postId) {
    return axios.get(`/api/posts/${postId}`)
  },
  deletePost (postId) {
    return axios.delete(`/api/posts/${postId}`)
  },
  savePost (post) {
    return post && post.id ? this.updatePost(post) : this.createPost(post)
  },
  createPost (post) {
    return axios.post(`/api/categories/${post.category_slug}/posts`, { post: post })
  },
  updatePost (post) {
    return axios.put(`/api/posts/${post.id}`, { post: post })
  }
}
