checkInstallLoad <- function(libName) {
  if(!require(libName, character.only=TRUE)) {
    install.packages(libName)
    require(libName, character.only=TRUE)
  }
}


checkInstallLoad('readr')
checkInstallLoad('dplyr')
checkInstallLoad('rlang')
checkInstallLoad('corrplot')
checkInstallLoad('pROC')
checkInstallLoad('ROCR')
checkInstallLoad('caret')
checkInstallLoad('glmnet')
checkInstallLoad('gridExtra')
