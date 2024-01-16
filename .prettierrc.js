const { execSync } = require('child_process')

const root = execSync('npm root -g').toString().trim()
const name = '@akijoey/prettier-config'

const config = require(`${root}/${name}`)

Object.assign(config, {
  plugins: config.plugins.map(plugin => {
    return require.resolve(`${root}/${name}/node_modules/${plugin}`)
  }),
  overrides: [
    {
      files: '*.pug',
      options: { parser: 'pug' }
    },
    {
      files: '*.styl',
      options: { parser: 'stylus' }
    }
  ]
})

module.exports = config
