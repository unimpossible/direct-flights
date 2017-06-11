//  config.js
//
//  Simple application configuration. Extend as needed.
module.exports = {  
    port: process.env.PORT || 3000,
  db: {
    host: process.env.DATABASE_HOST || '127.0.0.1',
    database: 'flights',
    user: 'flight-user',
    password: 'flyingawaywiththewind',
    port: 3306
  }
};