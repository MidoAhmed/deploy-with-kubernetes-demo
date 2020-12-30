'use strict';

module.exports = function (router) {
    router.get('/', (req, res, next) => {
		  res.render('about');
    });
};
