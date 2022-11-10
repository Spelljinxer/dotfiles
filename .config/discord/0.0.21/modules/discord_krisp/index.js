const KrispModule = require('./discord_krisp.node');

console.info('Initializing krisp module');
KrispModule._initialize();

KrispModule.getNcModels = function () {
  return new Promise((resolve) => {
    KrispModule._getNcModels((models) => resolve(models));
  });
};

KrispModule.getVadModels = function () {
  return new Promise((resolve) => {
    KrispModule._getVadModels((models) => resolve(models));
  });
};

module.exports = KrispModule;
