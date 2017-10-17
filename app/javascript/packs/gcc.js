import Vue from 'vue/dist/vue.esm'
import 'vue-material/dist/vue-material.css'
import VueMaterial from 'vue-material/dist/vue-material'
import ProductCard from '../components/product-card.vue'

document.addEventListener('turbolinks:load', () => {
  Vue.use(VueMaterial)

  // let element = document.getElementById("gcc-data")
  // let gcc = element.dataset.products
  // console.log(gcc)

  const app = new Vue({
    el: '#vue-gcc',
    data: {
      message: "Can you say hello?"
    },
    components: { ProductCard }
  })
})