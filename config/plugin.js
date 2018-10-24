'use strict';

// had enabled by egg
// exports.static = true;
module.exports.nunjucks = {
  enabled: true,
  package: 'egg-view-nunjucks',
};
module.exports.passport = {
  enable: true,
  package: 'egg-passport'
};
module.exports.passportGithub = {
  enable: true,
  package: 'egg-passport-github'
};
module.exports.mysql = {
  enable: true,
  package: 'egg-mysql'
}