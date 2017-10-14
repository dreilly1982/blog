<template lang="pug">
  .settings-page

    .section.py-0.my-1: .container
      breadcrumb(:items="breadcrumbItems")

    .section.py-0.my-1: .container
      .columns
        .column.is-3
          aside.menu
            p.menu-label General
            ul.menu-list
              li
                router-link(to='/settings') Categories
            p.menu-label
              | Administration
            ul.menu-list
              li: a Team Settings
              li
                a Manage Your Team
                ul
                  li: a Members
                  li: a Plugins
                  li: a Add a member
        .column.is-9
          h3.title.is-6 Categories
          a.button.is-primary(@click="newCategory") New category

          category-list(:categories="categories" @edit="editCategory" @delete="deleteCategory")

          b-modal(:active.sync="isCategoryModalActive" has-modal-card)
            category-edit-modal(:initialCategory="modalCategory" @submit="saveCategory")
</template>

<script>
import api from '../api'
import CategoryList from '../components/CategoryList'
import CategoryEditModal from '../components/CategoryEditModal'
import { mapGetters } from 'vuex'

export default {
  data () {
    return {
      breadcrumbItems: [ { text: 'Settings' } ],
      isCategoryModalActive: false,
      modalCategory: {
        name: '',
        description: ''
      }
    }
  },

  methods: {
    showModal (category = this.modalCategory) {
      this.modalCategory = category
      this.isCategoryModalActive = true
    },
    hideModal () {
      this.isCategoryModalActive = false
    },
    newCategory () {
      this.showModal({ name: '', description: '' })
    },
    editCategory (category) {
      this.showModal(category)
    },
    saveCategory (category) {
      api.saveCategory(category).then(() => {
        this.$store.dispatch('fetchCategories').then(() => {
          this.hideModal()
          this.$toast.open({ message: 'Category saved', type: 'is-success' })
        })
      })
    },
    deleteCategory (category) {
      this.$dialog.confirm({
        title: 'Deleting category',
        message: 'Are you sure you want to <b>delete</b> this category? This action cannot be undone.',
        confirmText: 'Delete Category',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: () => {
          api.deleteCategory(category.id).then(() => {
            this.$store.dispatch('fetchCategories').then(() => {
              this.$toast.open('Category deleted')
            })
          })
        }
      })
    }
  },
  computed: {
    ...mapGetters(['categories'])
  },
  components: {
    'category-list': CategoryList,
    'category-edit-modal': CategoryEditModal
  }
}
</script>
