/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.{html,php,js}", // Archivos en el directorio raíz
    "./**/*.{html,php,js}", // Archivos en cualquier subdirectorio
    "./node_modules/flowbite/**/*.js" // Archivos JS de Flowbite
  ],
  darkMode: 'class',
  theme: {
    extend: {
      fontFamily: {
        Poppins: ["Poppins", "sans-serif"],
        RedHatDisplay: ["RedHatDisplay", "sans-serif"]
      },
      gridTemplateColumns: {
        'footer': '1fr max-content',
      }
    },
  },
  plugins: [
    require('tailwind-scrollbar'),
    require('flowbite/plugin')
  ],
}
