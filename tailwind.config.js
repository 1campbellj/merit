module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  variants: {
    extend: {
      backgroundColor: ['checked'],
      textColor: ['checked']
    }
  }
}
