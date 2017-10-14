import Vue from 'vue'
// import Vue from 'vue/dist/vue.esm'
import router from './router'
import store from './store'
import App from './app'
import { sync } from 'vuex-router-sync'
import VueProgressBar from 'vue-progressbar'
import Buefy from 'buefy'
import VeeValidate from 'vee-validate'

import Breadcrumb from './components/Breadcrumb'
import Comments from './components/Comments'

import 'buefy/lib/buefy.css'
import './styles/main.scss'

Vue.use(Buefy)
Vue.use(VueProgressBar)
Vue.use(VeeValidate)

sync(store, router)

Vue.component('breadcrumb', Breadcrumb)
Vue.component('comments', Comments)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
