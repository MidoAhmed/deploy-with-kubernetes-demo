'use strict';

const featureRepository = require('../lib/featureRepository');

module.exports = function (router) {
    router.get('/', (req, res, next) => {
        featureRepository.getFeatures((err, features) => {
            if (err) return next(err);

            res.render('index', {
                features
            });
        });
    });
};


