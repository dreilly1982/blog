import Vue from 'vue'
import Router from 'vue-router'

import Home from '../pages/Home'
import Category from '../pages/Category'
import Post from '../pages/Post'
import PostEdit from '../pages/PostEdit'
import Settings from '../pages/Settings'

Vue.use(Router)

export default new Router({
  mode: 'history',
  linkExactActiveClass: 'is-active',
  linkActiveClass: 'is-active',
  routes: [
    {
      path: '/',
      component: Home
    },
    {
      path: '/categories/:id/posts',
      component: Category,
      props: true
    },
    {
      path: '/categories/:categoryId/posts/new',
      component: PostEdit,
      props: true
    },
    {
      path: '/categories/:categoryId/posts/:id',
      component: Post,
      props: true
    },
    {
      path: '/categories/:categoryId/posts/:id/edit',
      component: PostEdit,
      props: true
    },
    {
      path: '/settings',
      component: Settings
    }
  ]
})
