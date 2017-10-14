import Vue from 'vue'
import Vuex from 'vuex'
import api from '../api'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    categories: [],
    posts: []
  },
  actions: {
    fetchCategories ({ commit, state }) {
      return new Promise((resolve, reject) => {
        api.fetchCategories().then((response) => {
          commit('SET_CATEGORIES', response.data)
          resolve()
        }).catch((error) => {
          reject(error)
        })
      })
    },
    fetchPosts ({ commit, state }, category) {
      return new Promise((resolve, reject) => {
        api.fetchPosts(category).then((response) => {
          commit('SET_POSTS', response.data)
          resolve()
        })
      })
    },
    fetchPost ({ commit, state }, slug) {
      return new Promise((resolve, reject) => {
        api.fetchPost(slug).then(response => {
          commit('SET_CURRENT_POST', response.data)
          resolve()
        }, error => {
          reject(error)
        })
      })
    }
  },
  mutations: {
    SET_CATEGORIES (state, categories) {
      state.categories = categories
    },
    SET_POSTS (state, posts) {
      state.posts = posts
    }
  },
  getters: {
    category: (state, getters) => (categoryId) => {
      return state.categories.find(c => (c.slug === categoryId)) || {name: ''}
    },
    categories (state, getters) {
      return state.categories
    },
    posts (state, getters) {
      return state.posts
    }
  }
})
