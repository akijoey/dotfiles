const { execSync } = require('child_process')

const root = execSync('npm root -g').toString().trim()
const config = require(`${root}/@akijoey/prettier-config`)

module.exports = config
