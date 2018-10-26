require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::INFO

logger.info('Test passed')