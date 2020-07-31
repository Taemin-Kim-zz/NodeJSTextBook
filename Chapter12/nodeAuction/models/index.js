const Sequelize = require('sequelize');

const env = process.env.NODE_ENV || 'development';
const config = require('config');
const db = {};


const sequelize = new Sequelize(config.database, config.username, config.password, config,);

db.sequelize = sequelize;
db.Sequelize = Sequelize;

db.User = require('./user')(sequelize, Sequelize);
db.Good = require('./good')(sequelize, Sequelize);
db.Auction = require('./auction')(sequelize, Sequelize);

db.Good.belongsTo(db.User, { as: 'owner'} );
db.Good.belongsTo(db.User, { as: 'sold'});
db.User.hasmany(db.Auction);
db.Good.hasmany(db.Auction);
db.Auction.belongsTo(db.User);
db.Auction.belongsTo(db.Good);

module.exports = db;